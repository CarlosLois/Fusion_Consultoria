inherited frmHistoricoDownload: TfrmHistoricoDownload
  Caption = 'Hist'#243'rico de Dpwnload'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object grdHistorico: TDBGrid
    Left = 9
    Top = 31
    Width = 982
    Height = 551
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsHistorico
    TabOrder = 5
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
end
