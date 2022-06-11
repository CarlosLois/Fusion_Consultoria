program DownloadFusionConsultoria;

uses
  Vcl.Forms,
  uFileDownload in 'uFileDownload.pas',
  uAcesso in 'uAcesso.pas' {frmAcesso},
  uDMConection in 'uDMConection.pas' {DMConection: TDataModule},
  uConfigConexao in 'uConfigConexao.pas',
  uMensagem in 'uMensagem.pas' {frmMensagem},
  uFormularioPadrao in 'uFormularioPadrao.pas' {frmDefault},
  uCentralDownload in 'uCentralDownload.pas' {frmCentralDownload},
  uHistoricoDownload in 'uHistoricoDownload.pas' {frmHistoricoDownload};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCentralDownload, frmCentralDownload);
  Application.CreateForm(TDMConection, DMConection);
  Application.CreateForm(TfrmDefault, frmDefault);
  Application.Run;
end.
