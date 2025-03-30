*** Settings ***
Resource  ../resources/serve-rest-front.resource

*** Test Cases ***
Login com sucesso Serve Rest Front
  Abrir o navegador
  Ir para o site Serve Rest Front
  Preencher os dados do novo usuário e cadastrar
  Conferir usuário cadastrado com sucesso