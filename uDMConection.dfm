object DMConection: TDMConection
  Height = 201
  Width = 389
  PixelsPerInch = 96
  object ConexaoSQLite: TFDConnection
    ConnectionName = 'ConexaoSQLite'
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=D:\_Projetos Carlos\Avalia'#231#245'es\Fusion Consultoria\DataB' +
        'ase\CentralDownload.db')
    LoginPrompt = False
    Left = 72
    Top = 8
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 88
  end
end
