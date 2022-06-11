unit uConfigConexao;

interface

uses System.SysUtils;

function ConectarBancoDados(const DataBaseFile : String) : Boolean;

implementation

uses uDMConection, uMensagem;

function ConectarBancoDados(const DataBaseFile : String) : Boolean;
begin
  Result := False;

  if not FileExists(DataBaseFile) then
  begin
    Aviso('O arquivo de Banco de Dados não é um arquivo válido!');
    Exit;
  end;

  try
    DMConection.ConexaoSQLite.Params.Database := DataBaseFile;


    DMConection.ConexaoSQLite.Connected := True;
    Result := DMConection.ConexaoSQLite.Connected;
  except
    on E : Exception do
      Raise Exception.Create('Ocorreu um erro ao conectar com o banco da dados. Detalhes: '+E.Message);
  end;
end;

end.
