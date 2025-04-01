*** Settings ***
Documentation  Testes de automação com o Browser Library "https://robotframework-browser.org/"
Resource  ../resources/serve_rest_front.resource

*** Test Cases ***
Login com sucesso Serve Rest Front
  [Documentation]  Teste de login com sucesso no site Serve Rest Front
  [Tags]  CT01
  Abrir o navegador
  Ir para o site Serve Rest Front
  Preencher os dados do novo usuário e cadastrar
  Conferir usuário cadastrado com sucesso

Exemplo utilizando Requisições HTTP
  [Tags]  CT02
  Abrir o navegador
  Ir para o site Serve Rest Front
  Criar usuário via API
  Logar com o usuário cadastrado via API

Exemplo Utilizando o Storage Armazenado no Contexto
  [Tags]  CT03
  Abrir o Site Serve Rest Front Logado
  Acessar a Lista de usuários