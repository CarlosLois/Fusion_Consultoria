unit uFormularioPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmDefault = class(TForm)
    pnlCaption: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    procedure pnlCaptionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pnlCaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlCaptionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnlCaptionDblClick(Sender: TObject);
  private
    { Private declarations }
    LocalClickMouse    : TPoint;
    ClickMouseCaptured : Boolean;
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.dfm}

procedure TfrmDefault.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDefault.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TfrmDefault.pnlCaptionDblClick(Sender: TObject);
begin
  if WindowState = wsMaximized then
    WindowState := wsNormal
  else
    WindowState := wsMaximized;
end;

procedure TfrmDefault.pnlCaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClickMouseCaptured := (True) and (not (WindowState = wsMaximized));
  LocalClickMouse.X  := X;
  LocalClickMouse.Y  := Y;
end;

procedure TfrmDefault.pnlCaptionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ClickMouseCaptured then
  begin
    Self.Left := Self.Left - (LocalClickMouse.X - X);
    Self.Top  := Self.Top  - (LocalClickMouse.Y - Y);
  end;
end;

procedure TfrmDefault.pnlCaptionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClickMouseCaptured := False;
end;

end.
