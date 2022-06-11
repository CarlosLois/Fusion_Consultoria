unit uAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, System.IniFiles;


type
  TfrmAcesso = class(TForm)
    Panel1: TPanel;
    btnAcesso: TSpeedButton;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    imgLogo: TImage;
    lblSaudacao: TLabel;
    edtDataBase: TEdit;
    pnlFindDB: TPanel;
    iimsFindDB: TImage;
    odgDataBase: TOpenDialog;
    procedure btnAcessoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure iimsFindDBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    ConfigConection : TIniFile;
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

const cFileNameConnection : String = 'ConfigConnection.ini';

function Execute : Boolean;

implementation

{$R *.dfm}

uses uConfigConexao;

function Execute : Boolean;
begin
  frmAcesso := TfrmAcesso.Create(nil);
  try
    Result := frmAcesso.ShowModal = mrOk;
  finally

    FreeAndNil(frmAcesso.ConfigConection);
    FreeAndNil(frmAcesso);
  end;
end;

procedure TfrmAcesso.btnAcessoClick(Sender: TObject);
begin
  if not ConectarBancoDados(edtDataBase.Text) then
    Exit;

  ConfigConection.WriteString('DATABASE', 'FILE_NAME', edtDataBase.Text);

  ModalResult := mrOk;
end;

procedure TfrmAcesso.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAcesso.FormShow(Sender: TObject);
begin
  ConfigConection  := TIniFile.Create(ExtractFilePath(Application.ExeName)+cFileNameConnection);
  edtDataBase.Text := ConfigConection.ReadString('DATABASE', 'FILE_NAME', '');
end;

procedure TfrmAcesso.iimsFindDBClick(Sender: TObject);
begin
  if not odgDataBase.Execute then
    Exit;

  edtDataBase.Text := odgDataBase.FileName;
end;

end.
