unit uHistoricoDownload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormularioPadrao, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmHistoricoDownload = class(TfrmDefault)
    qryHistorico: TFDQuery;
    qryHistoricoCODIGO: TFMTBCDField;
    qryHistoricoURL: TStringField;
    qryHistoricoDATAINICIO: TDateTimeField;
    qryHistoricoDATAFIM: TDateTimeField;
    dsHistorico: TDataSource;
    grdHistorico: TDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoDownload: TfrmHistoricoDownload;

procedure Execute;

implementation

{$R *.dfm}

procedure Execute;
begin
  frmHistoricoDownload := TfrmHistoricoDownload.Create(nil);
  try
    frmHistoricoDownload.ShowModal;

  finally
    FreeAndNil(frmHistoricoDownload);
  end;
end;

procedure TfrmHistoricoDownload.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  qryHistorico.Close;
  inherited;
end;

procedure TfrmHistoricoDownload.FormShow(Sender: TObject);
begin
  inherited;
  qryHistorico.Open;
end;

end.
