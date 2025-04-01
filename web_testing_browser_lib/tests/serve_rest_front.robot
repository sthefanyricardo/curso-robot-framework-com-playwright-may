*** Settings ***
Resource  ../resources/serve_rest_front.resource

*** Test Cases ***
Login com sucesso Serve Rest Front
  [Documentation]  Teste de login com sucesso no site Serve Rest Front
  [Tags]  CT01
  Abrir o navegador
  Ir para o site Serve Rest Front
  Preencher os dados do novo usuário e cadastrar
  Conferir usuário cadastrado com sucesso