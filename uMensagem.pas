unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type

  TSentidoAnimate = (saLeftToRight, saRightToLeft, saUpToDown, saDownToUp, saCenter, saUnknown);

  TfrmMensagem = class(TForm)
    pnlOK_NAO: TPanel;
    btnOK_NAO: TSpeedButton;
    pnlSIM: TPanel;
    btnSIM: TSpeedButton;
    lblMensagem: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSIMClick(Sender: TObject);
    procedure btnOK_NAOClick(Sender: TObject);
  private
    { Private declarations }

  procedure AnimatemMSG(aSENTIDO : TSentidoAnimate;
                        bHIDE    : Boolean = False;
                        nSPEED   : Integer = 200);
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

function Confirma(const MSG : String) : Boolean;
procedure Aviso(const MSG : String);

implementation

{$R *.dfm}

function Mensagem(const MSG : String; DlgType : TMsgDlgType = mtInformation) : Boolean;
begin
  frmMensagem := TfrmMensagem.Create(nil);
  frmMensagem.Position := poScreenCenter;
  Sleep(500);

  try
    with frmMensagem do
    begin
      pnlSIM.Visible := DlgType = mtConfirmation;
      case DlgType of
        mtInformation  : btnOK_NAO.Caption := 'OK';
        mtConfirmation : btnOK_NAO.Caption := 'Não';
      end;

      lblMensagem.Caption := MSG;

      Result := ShowModal = mrYes;
    end;

  finally
    FreeAndNil(frmMensagem);
  end;
end;

function Confirma(const MSG : String) : Boolean;
begin
  Result := Mensagem(MSG, mtConfirmation);
end;

procedure Aviso(const MSG : String);
begin
  Mensagem(MSG);
end;

{ TfrmMensagem }

procedure TfrmMensagem.AnimatemMSG(aSENTIDO: TSentidoAnimate; bHIDE: Boolean = False; nSPEED: Integer= 200);
var
  dwFlags: DWORD;
begin
  dwFlags := AW_SLIDE;

  //SE FOR ESCONDER
  if bHIDE then
  begin
    dwFlags := dwFlags + AW_HIDE;

    case aSENTIDO of
      saLeftToRight : dwFlags := dwFlags + AW_HOR_NEGATIVE;
      saRightToLeft : dwFlags := dwFlags + AW_HOR_POSITIVE;
      saUpToDown    : dwFlags := dwFlags + AW_VER_NEGATIVE;
      saDownToUp    : dwFlags := dwFlags + AW_VER_POSITIVE;
      saCenter      : dwFlags := dwFlags + AW_CENTER;
    end;
  end
  else
  begin
    dwFlags := dwFlags + AW_ACTIVATE;

    case aSENTIDO of
      saLeftToRight : dwFlags := dwFlags + AW_HOR_POSITIVE;
      saRightToLeft : dwFlags := dwFlags + AW_HOR_NEGATIVE;
      saUpToDown    : dwFlags := dwFlags + AW_VER_POSITIVE;
      saDownToUp    : dwFlags := dwFlags + AW_VER_NEGATIVE;
      saCenter      : dwFlags := dwFlags + AW_CENTER;
    end;
  end;

  AnimateWindow(Self.Handle, nSPEED, dwFlags);
end;

procedure TfrmMensagem.btnOK_NAOClick(Sender: TObject);
begin
  if pnlSIM.Visible then
    ModalResult := mrNo
  else
    btnSIM.Click;
end;

procedure TfrmMensagem.btnSIMClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AnimatemMSG(saCenter, True);
end;

procedure TfrmMensagem.FormShow(Sender: TObject);
begin
  AnimatemMSG(saCenter);
end;

end.
