# Fusion_Consultoria

- Projeto de Central de Downloads para avaliação no processo seletivo da empresa Fusion Consultoria
- Aplicação para realização de Download atravéz de processamento de Threads.
- Aplicação desenvolvida em Delphi 11 Alexandria com conexão ao banco de dados SQLite e componente de conexão FireDac.

# Sistema

# uAcesso.pas

- Tela de acesso ao sistema sem necessidade de Login.
- Gravação e Leitura de arquivo .INI acesso ao banco de dados.
- Seleção do arquivo do banco de dados em tela.

# uFormularioPadrao.pas

- Criado formulário padrão de onde os formulários herdam exceto formulário de mensagem e de Login para manter o padrão visual.
- Retirado menu do formulário para ter um melhor controle visual.
- Regra de maximizar e mover o formulário programado.

# uCentralDownload.pas

- Tela principal do Sistema
- Gerenciamento dos downloads.

# uCentralDownload.pas/Download

- Campo informativo da URL de download.
- Barra de Progressao mais Lavel para exibir status do download.
- Botão para iniciar o downlaod com mensagem de confirmação.
- Utilizado TSaveDialog para selecionar local onde o download será realizado.
- Botão para para o downlaod com mensagem de confirmação.
- Botão para exibir percentual de progresso do downlaod (conforme solicitado).
- Botão para exibir hitórico de download (conforme solicitado) atravéz da unit uHistoricoDownload.pas.
- Botão para limpar histórico de download com mensagem de confirmação.
- Botão sair com confirmação caso haja downlaod em andamento.

# uCentralDownload.pas/Histórico

- Mesmo informativo da tela de exibição através do botão que exibir hitórico.
obs. Aqui poderia usar o próprio formulário frmHistoricoDownload colocando como parent a tabsheet.


# uMensagem.pas

- Formulário de exibição das mensagens Confirma e Aviso.

# uFileDownload.pas

- Classe herdada da TThread.
- Execução do Download.
- Atualização da barra de progresso.
- Atualização do Label com status.
- Inserção dos dados no banco de dados com histórico de donwloads.

# uDMConection.pas

- Data Módulo com componentes de conexão.

# uConfigConexao.pas

- Biblioteca de configuração e conexão com bando de dados.






