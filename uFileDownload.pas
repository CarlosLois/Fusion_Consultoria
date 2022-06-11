unit uFileDownload;

interface

uses Vcl.StdCtrls, System.SysUtils, System.Net.HttpClientComponent, Vcl.Dialogs, System.Classes, Vcl.ComCtrls, FireDAC.Comp.Client, uMensagem;

type
  TFileDownload = class(TThread)
  private
    FFileStream    : TFileStream;
    FFileName      : String;
    FURL           : String;

    FDataInicio    : TDateTime;

    FMaxPosition   ,
    FPosition      : Integer;

    FPercProgress  : Real;
    FEmAndamento   : Boolean;


    FBarraProgress : TProgressBar;
    FLabelProgress : TLabel;

    FNetHTTPClient : TNetHTTPClient;

    FqryInsert     : TFDQuery;

    procedure FOnReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);

    procedure AtualizaProgress;
    procedure AtualizaLabel;
    procedure AtualizaHistorico;

    procedure AvisoConcluido;

    procedure StartDownload;

    function GetPercProgress : Real;
    function GetEmAndamento  : Boolean;

  public
    Constructor Create(const URLDownload: String; const FileName : String; ProgressBar : TProgressBar = nil; LabelProgress : TLabel = nil);
    Destructor  Detroy;

    procedure StopDownload;

    property PercProgress : Real    read GetPercProgress;
    property EmAndamento  : Boolean read GetEmAndamento;

  protected
    procedure Execute; override;
  end;

implementation

{ TDownload }

procedure TFileDownload.AtualizaHistorico;
begin
  FqryInsert.Close;
  FqryInsert.ParamByName('URL').AsString          := FURL;
  FqryInsert.ParamByName('DATAINICIO').AsDateTime := FDataInicio;
  FqryInsert.ParamByName('DATAFIM').AsDateTime    := Now;
  try
    FqryInsert.ExecSQL;
  except
    on E : exception do
      raise Exception.Create('Ocorreu um erro ao gravar o histórico. Detalhes: '+ E.Message);
  end;
end;

procedure TFileDownload.AtualizaLabel;
begin
  if Assigned(FLabelProgress) then
    FLabelProgress.Caption := 'Download Progresso...'+FormatFloat('#,##0.00%', GetPercProgress);
end;

procedure TFileDownload.AtualizaProgress;
begin
  if Assigned(FBarraProgress) then
  begin
    FBarraProgress.Max      := FMaxPosition;
    FBarraProgress.Position := FPosition;
  end;
end;

procedure TFileDownload.AvisoConcluido;
begin
  Aviso('Donwload concluído com sucesso!');
  if Assigned(FBarraProgress) then
    FBarraProgress.Position := 0;

  if Assigned(FLabelProgress) then
    FLabelProgress.Caption := 'Download Concluído';
end;

constructor TFileDownload.Create(const URLDownload: String; const FileName : String; ProgressBar : TProgressBar = nil; LabelProgress : TLabel = nil);
begin
  inherited Create(True);

  FURL                         := URLDownload;
  FFileName                    := FileName;

  FEmAndamento                 := False;

  FBarraProgress               := ProgressBar;
  FLabelProgress               := LabelProgress;
  FFileStream                  := TFileStream.Create(FFileName, fmCreate);

  FNetHTTPClient               := TNetHTTPClient.Create(nil);
  FNetHTTPClient.OnReceiveData := FOnReceiveData;

  FqryInsert                   := TFDQuery.Create(nil);
  FqryInsert.ConnectionName    := 'ConexaoSQLite';
  FqryInsert.SQL.Text          := 'INSERT INTO LOGDOWNLOAD VALUES ((SELECT (CASE                                                    '#13 +
                                  '                                           WHEN MAX(CODIGO) IS NULL THEN 0                       '#13 +
                                  '                                           ELSE MAX(CODIGO)                                      '#13 +
                                  '                                         END) + 1 FROM LOGDOWNLOAD), :URL, :DATAINICIO, :DATAFIM)';

  FreeOnTerminate              := True;
end;

destructor TFileDownload.Detroy;
begin
  if Assigned(FNetHTTPClient) then
    FreeAndNil(FNetHTTPClient);

  if Assigned(FFileStream) then
    FreeAndNil(FFileStream);

  if Assigned(FqryInsert) then
  begin
    FqryInsert.Close;
    FreeAndNil(FqryInsert);
  end;

  FBarraProgress := nil;
  FLabelProgress := nil;
end;

procedure TFileDownload.Execute;
begin
  while not (Self.Terminated) do
  begin
    Sleep(10);
    StartDownload;
  end;
end;

procedure TFileDownload.FOnReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);
begin
  FMaxPosition := AContentLength;
  FPosition    := AReadCount;

  Synchronize(AtualizaProgress);
  Synchronize(AtualizaLabel);

  AAbort := Terminated;
end;

function TFileDownload.GetEmAndamento: Boolean;
begin
  Result := FEmAndamento;
end;

function TFileDownload.GetPercProgress: Real;
begin
  Result := (FPosition / FMaxPosition) * 100;
end;

procedure TFileDownload.StartDownload;
begin
  try
    FEmAndamento := True;
    FDataInicio  := Now;

    try
      FNetHTTPClient.Get(FURL, FFileStream);
    except
      raise Exception.Create('Erro ao iniciar o Download...');
    end;

    if FEmAndamento then
    begin
      Synchronize(AtualizaHistorico);
      Synchronize(AvisoConcluido);
    end;
  finally
    if Assigned(FFileStream) then
      FreeAndNil(FFileStream);

    StopDownload;
  end;
end;

procedure TFileDownload.StopDownload;
begin
  FEmAndamento := False;
  FPosition    := 0;
  FMaxPosition := 0;

  inherited Terminate;
end;

end.
