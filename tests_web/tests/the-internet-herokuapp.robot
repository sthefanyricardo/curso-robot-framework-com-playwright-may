*** Settings ***
Documentation  Testes de automação com o Browser Library "https://robotframework-browser.org/"
Resource  ../resources/the-internet-herokuapp.resource
Test Teardown  Tirar Print

*** Test Cases ***
Interagindo com Dropdown
  [Documentation]  Teste de interação com Dropdown
  [Tags]  CT01
  Acessar "https://the-internet.herokuapp.com/dropdown"
  Selecionar opção "Option 1"

Interagindo com iFrames
  [Documentation]  Teste de interação com iFrames
  [Tags]  CT02
  Acessar "https://the-internet.herokuapp.com/iframe"
  Obter frase de dentro do iFrame

Interagindo com Tabelas
  [Documentation]  Teste de interação com Tabelas
  [Tags]  CT03
  Acessar "https://the-internet.herokuapp.com/tables"
  Conferindo valores em tabelas

Interagindo com novas abas (pages)
  [Documentation]  Teste de interação com novas abas (pages)
  [Tags]  CT04
  Acessar "https://the-internet.herokuapp.com/windows"
  ${pagina_id}  Get Page Ids  CURRENT
  Clicar e ir para a nova página aberta
  Voltar para a página inicial  ${pagina_id}