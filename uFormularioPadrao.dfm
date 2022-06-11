object frmDefault: TfrmDefault
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmDefault'
  ClientHeight = 620
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  DesignSize = (
    1000
    620)
  TextHeight = 15
  object pnlCaption: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Formul'#225'rio Padr'#227'o'
    Color = 13150800
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Optima'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnDblClick = pnlCaptionDblClick
    OnMouseDown = pnlCaptionMouseDown
    OnMouseMove = pnlCaptionMouseMove
    OnMouseUp = pnlCaptionMouseUp
  end
  object Panel7: TPanel
    Left = 997
    Top = 25
    Width = 3
    Height = 592
    Align = alRight
    BevelOuter = bvNone
    Color = 13150800
    ParentBackground = False
    TabOrder = 1
  end
  object Panel8: TPanel
    Left = 0
    Top = 25
    Width = 3
    Height = 592
    Align = alLeft
    BevelOuter = bvNone
    Color = 13150800
    ParentBackground = False
    TabOrder = 2
  end
  object Panel6: TPanel
    Left = 0
    Top = 617
    Width = 1000
    Height = 3
    Align = alBottom
    BevelOuter = bvNone
    Color = 13150800
    ParentBackground = False
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 888
    Top = 588
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    Color = 13150800
    ParentBackground = False
    TabOrder = 4
    object btnSair: TSpeedButton
      Left = 0
      Top = 0
      Width = 100
      Height = 25
      Align = alClient
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -12
      Font.Name = 'Optima'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSairClick
      ExplicitLeft = 76
      ExplicitTop = 16
      ExplicitWidth = 109
    end
  end
end
