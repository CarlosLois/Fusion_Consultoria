unit uCentralDownload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormularioPadrao, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uFileDownload;

type
  TfrmCentralDownload = class(TfrmDefault)
    pgcDownload: TPageControl;
    tbsDownload: TTabSheet;
    lblURLDownload: TLabel;
    lblProgress: TLabel;
    edtURLDownload: TEdit;
    pgbDownload: TProgressBar;
    Panel1: TPanel;
    btnStop: TSpeedButton;
    Panel3: TPanel;
    btnPercProgresso: TSpeedButton;
    Panel4: TPanel;
    btnStart: TSpeedButton;
    Panel5: TPanel;
    btnHistorico: TSpeedButton;
    tbsHistorico: TTabSheet;
    qryHistorico: TFDQuery;
    qryHistoricoCODIGO: TFMTBCDField;
    qryHistoricoURL: TStringField;
    qryHistoricoDATAINICIO: TDateTimeField;
    qryHistoricoDATAFIM: TDateTimeField;
    dsHistorico: TDataSource;
    svdArquivo: TSaveDialog;
    grdHistorico: TDBGrid;
    Panel9: TPanel;
    btnLimparHistorico: TSpeedButton;
    qryDelHistorico: TFDQuery;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnPercProgressoClick(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure pgcDownloadChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnLimparHistoricoClick(Sender: TObject);
  private
    { Private declarations }
    FileDownload       : TFileDownload;

    function GetFileName(const URL : String) : String;
  public
    { Public declarations }
  end;

var
  frmCentralDownload: TfrmCentralDownload;

implementation

{$R *.dfm}

uses uAcesso, uMensagem, uHistoricoDownload;

procedure TfrmCentralDownload.btnHistoricoClick(Sender: TObject);
begin
  inherited;
  uHistoricoDownload.Execute;
end;

procedure TfrmCentralDownload.btnLimparHistoricoClick(Sender: TObject);
begin
  inherited;
  if not Confirma('Deseja apagar o histórico de download?') then
    Exit;

  try
    qryDelHistorico.ExecSQL;
    Aviso('Histórico apagado com sucesso!');
  except
    raise Exception.Create('Ocorreu um erro ao deletar o histórico!');
  end;
end;

procedure TfrmCentralDownload.btnPercProgressoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FileDownload) then
    Exit;

  Aviso('Percentual de Download...'+FormatFloat('#,##0.00%', FileDownload.PercProgress));
end;

procedure TfrmCentralDownload.btnStartClick(Sender: TObject);
var
  FURL          ,
  FFileName     ,
  FFileNameDest : String;

begin
  if not Confirma('Deseja realizar o download do Arquivo?') then
    Exit;

  FURL                := edtURLDownload.Text;
  FFileName           := GetFileName(FURL);

  svdArquivo.FileName := FFileName;
  svdArquivo.Filter   := '*'+ExtractFileExt(FFileName)+'|*'+ExtractFileExt(FFileName);


  if not svdArquivo.Execute then
    Exit;

  FFileName := svdArquivo.FileName;

  FileDownload := TFileDownload.Create(FURL, FFileName, pgbDownload, lblProgress);
  FileDownload.Start;
end;

procedure TfrmCentralDownload.btnStopClick(Sender: TObject);
begin
  if not Assigned(FileDownload) then
    Exit;

  if not Confirma('Deseja interromper o Download?') then
    Exit;

  FileDownload.StopDownload;
end;

procedure TfrmCentralDownload.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(FileDownload) then
    if FileDownload.EmAndamento then
      if not Confirma('Existe um download em andamento, deseja interrompe-lo?') then
        Exit;

  inherited;
end;

procedure TfrmCentralDownload.FormShow(Sender: TObject);
begin
  inherited;
  if not uAcesso.Execute then
  begin
    Close;
    Exit;
  end;
end;

function TfrmCentralDownload.GetFileName(const URL: String): String;
begin
  Result := ExtractFileName(StringReplace(URL, '/', '\', [rfReplaceAll]));
end;

procedure TfrmCentralDownload.pgcDownloadChange(Sender: TObject);
begin
  inherited;
  if pgcDownload.ActivePage = tbsHistorico then
  begin
    qryHistorico.Close;
    qryHistorico.Open;
  end;
end;

end.
