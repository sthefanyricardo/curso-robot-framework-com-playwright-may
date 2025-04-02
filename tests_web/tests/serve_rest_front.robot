*** Settings ***
Documentation  Testes de automação com o Browser Library "https://robotframework-browser.org/"
Resource  ../resources/serve_rest_front.resource
Suite Setup  Abrir o navegador

*** Test Cases ***
Login com sucesso Serve Rest Front
  [Documentation]  Teste de login com sucesso no site Serve Rest Front
  [Tags]  CT01
  Cadastrar novo usuário
  
Exemplo utilizando Requisições HTTP
  [Documentation]  Teste de login com sucesso no site Serve Rest Front utilizando requisições HTTP
  [Tags]  CT02
  Ir para o site Serve Rest Front
  Criar usuário via API
  Logar com o usuário cadastrado via API

Exemplo Utilizando o Storage Armazenado no Contexto
  [Documentation]  Teste de login com sucesso no site Serve Rest Front utilizando o Storage Armazenado no Contexto
  [Tags]  CT03
  [Setup]  Cadastrar Usuário e Logar
  Abrir o Site Serve Rest Front Logado
  Acessar a listagem de usuários cadastrados

Desafio 01: Cadastrar e consultar usuários cadastrados
  [Documentation]  Teste que confere se o novo usuário é mostrado na listagem de usuários
  [Tags]  CT04  Desafio01
  Cadastrar novo usuário
  Acessar a listagem de usuários cadastrados
  Conferir o usuário cadastrado na listagem de usuários

Desafio 02: Cadastrar e consultar produtos cadastrados
  [Documentation]  Teste que confere se o novo produto é mostrado na listagem de produtos
  [Tags]  CT05  Desafio02
  [Setup]  Realizar o login com sucesso
  Cadastrar um produto 
  Conferir o produto cadastrado na listagem de produtos