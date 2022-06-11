inherited frmCentralDownload: TfrmCentralDownload
  Caption = 'frmCentralDownload'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlCaption: TPanel
    Caption = 'Central de Downloads'
  end
  object pgcDownload: TPageControl
    Left = 9
    Top = 31
    Width = 983
    Height = 551
    ActivePage = tbsDownload
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    OnChange = pgcDownloadChange
    object tbsDownload: TTabSheet
      Caption = 'Download'
      DesignSize = (
        975
        521)
      object lblURLDownload: TLabel
        Left = 3
        Top = 8
        Width = 111
        Height = 15
        Caption = 'URL para Download'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13150800
        Font.Height = -12
        Font.Name = 'Optima'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblProgress: TLabel
        Left = 3
        Top = 67
        Width = 128
        Height = 15
        Caption = 'Progresso Download...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 13150800
        Font.Height = -12
        Font.Name = 'Optima'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtURLDownload: TEdit
        Left = 3
        Top = 29
        Width = 969
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 
          'https://s3.amazonaws.com/gupy5/production/companies/28089/emails' +
          '/1652209126375/3ba39950-cc9a-11ec-990b-813a8f7f611a/avaliao_delp' +
          'hi.pdf'
      end
      object pgbDownload: TProgressBar
        Left = 3
        Top = 88
        Width = 969
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 115
        Top = 120
        Width = 100
        Height = 25
        BevelOuter = bvNone
        Color = 13150800
        ParentBackground = False
        TabOrder = 2
        object btnStop: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 25
          Align = alClient
          Caption = 'Stop Download'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -12
          Font.Name = 'Optima'
          Font.Style = []
          ParentFont = False
          OnClick = btnStopClick
          ExplicitLeft = 76
          ExplicitTop = 16
          ExplicitWidth = 109
        end
      end
      object Panel3: TPanel
        Left = 227
        Top = 120
        Width = 100
        Height = 25
        BevelOuter = bvNone
        Color = 13150800
        ParentBackground = False
        TabOrder = 3
        object btnPercProgresso: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 25
          Align = alClient
          Caption = '% Progresso'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -12
          Font.Name = 'Optima'
          Font.Style = []
          ParentFont = False
          OnClick = btnPercProgressoClick
          ExplicitLeft = 76
          ExplicitTop = 16
          ExplicitWidth = 109
        end
      end
      object Panel4: TPanel
        Left = 3
        Top = 120
        Width = 100
        Height = 25
        BevelOuter = bvNone
        Color = 13150800
        ParentBackground = False
        TabOrder = 4
        object btnStart: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 25
          Align = alClient
          Caption = 'Start Download'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -12
          Font.Name = 'Optima'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnStartClick
          ExplicitLeft = 8
          ExplicitTop = 16
          ExplicitWidth = 109
        end
      end
      object Panel5: TPanel
        Left = 760
        Top = 120
        Width = 100
        Height = 25
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = 13150800
        ParentBackground = False
        TabOrder = 5
        object btnHistorico: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 25
          Align = alClient
          Caption = 'Hist'#243'rico'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -12
          Font.Name = 'Optima'
          Font.Style = []
          ParentFont = False
          OnClick = btnHistoricoClick
          ExplicitLeft = 76
          ExplicitTop = 16
          ExplicitWidth = 109
        end
      end
      object Panel9: TPanel
        Left = 870
        Top = 120
        Width = 100
        Height = 25
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = 13150800
        ParentBackground = False
        TabOrder = 6
        object btnLimparHistorico: TSpeedButton
          Left = 0
          Top = 0
          Width = 100
          Height = 25
          Align = alClient
          Caption = 'Limpar Hist.'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -12
          Font.Name = 'Optima'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparHistoricoClick
          ExplicitLeft = 76
          ExplicitTop = 16
          ExplicitWidth = 109
        end
      end
    end
    object tbsHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 1
      DesignSize = (
        975
        521)
      object grdHistorico: TDBGrid
        Left = 3
        Top = 3
        Width = 969
        Height = 515
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsHistorico
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 13150800
            Title.Font.Height = -12
            Title.Font.Name = 'Optima'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'URL'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 13150800
            Title.Font.Height = -12
            Title.Font.Name = 'Optima'
            Title.Font.Style = [fsBold]
            Width = 642
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAINICIO'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 13150800
            Title.Font.Height = -12
            Title.Font.Name = 'Optima'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAFIM'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 13150800
            Title.Font.Height = -12
            Title.Font.Name = 'Optima'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end>
      end
    end
  end
  object qryHistorico: TFDQuery
    ConnectionName = 'ConexaoSQLite'
    SQL.Strings = (
      'SELECT *'
      '  FROM LOGDOWNLOAD'
      ' ORDER BY DATAINICIO DESC '
      '  ')
    Left = 360
    Top = 224
    object qryHistoricoCODIGO: TFMTBCDField
      DisplayLabel = '#'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 22
      Size = 0
    end
    object qryHistoricoURL: TStringField
      DisplayLabel = 'URL Download'
      FieldName = 'URL'
      Origin = 'URL'
      Required = True
      Size = 600
    end
    object qryHistoricoDATAINICIO: TDateTimeField
      DisplayLabel = 'Dt. Inicio'
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
      Required = True
    end
    object qryHistoricoDATAFIM: TDateTimeField
      DisplayLabel = 'Dt. Fim'
      FieldName = 'DATAFIM'
      Origin = 'DATAFIM'
    end
  end
  object dsHistorico: TDataSource
    DataSet = qryHistorico
    Left = 432
    Top = 225
  end
  object svdArquivo: TSaveDialog
    Left = 32
    Top = 520
  end
  object qryDelHistorico: TFDQuery
    ConnectionName = 'ConexaoSQLite'
    SQL.Strings = (
      'DELETE'
      '  FROM LOGDOWNLOAD'
      '  ')
    Left = 296
    Top = 224
  end
end
