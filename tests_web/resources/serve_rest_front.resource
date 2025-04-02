*** Settings ***
Library  Browser
# ...  timeout=00:00:05
# ...  enable_presenter_mode=${true}
Library  FakerLibrary
Library  DateTime
Library  String

*** Variables ***
${BROWSER}   chromium
${HEADLESS}  ${false}
${SITE_SERVE_REST}   https://front.serverest.dev/

*** Keywords ***
Abrir o navegador
  New Browser  browser=${BROWSER}
  ...  headless=${HEADLESS}
  
  ${TRACE_NAME}  FakerLibrary.Uuid 4
  ${NOW}   Get Current Date  result_format=%d-%m-%Y_%H%M%S
  New Context  viewport={'width': 1200, 'height': 800}
  # ...  tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
  # ...  recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}

Ir para o site Serve Rest Front
  New Page   url=${SITE_SERVE_REST}
  ${title}   Get Title  ==  Front - ServeRest
  Log  ${title}

Gerar os dados para o novo usuário
  [Documentation]  Gerar os dados para o novo usuário com a biblioteca FakerLibrary
  ${EMAIL}  FakerLibrary.Email
  ${NOME}  FakerLibrary.Name
  ${NOME_FORMATADO}  Replace String  ${NOME}  ${SPACE}  _
  ${EMAIL}  Catenate  ${NOME_FORMATADO}@testeautomacao.com
  Set Suite Variable  ${SENHA}  123456
  Set Suite Variable  ${NOME}
  Set Suite Variable  ${EMAIL}

Preencher os dados do novo usuário e cadastrar
  # Record Selector
  # Click  css=.btn-link
  # Click  text="Cadastre-se"
  Click   css=a[data-testid='cadastrar']
  Fill Text   css=input[data-testid='nome']   ${NOME}
  Fill Text   css=input[data-testid='email']  ${EMAIL}
  Fill Text   css=input[data-testid='password']   ${SENHA}
  Check Checkbox  css=input[data-testid='checkbox']
  # Click  css=button[data-testid='cadastrar']
  Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Conferir usuário cadastrado com sucesso
  Wait For Elements State  h1   visible
  Get Text  h1  ==  Bem Vindo ${NOME}
  Get Element States  css=button[data-testid='logout']  validate  value & visible

Cadastrar novo usuário
  Ir para o site Serve Rest Front
  Gerar os dados para o novo usuário
  Preencher os dados do novo usuário e cadastrar
  Conferir usuário cadastrado com sucesso

Acessar a listagem de usuários cadastrados
  Click  css=a[data-testid='listarUsuarios']

Conferir o usuário cadastrado na listagem de usuários
  ${elemento}  Get Table Cell Element  css=table  "Nome"  "${EMAIL}"
  ${usuario_nome}  Get Text  ${elemento}  ==  ${NOME}
  Highlight Elements  ${elemento}
  Take Screenshot   fullPage=${true}  

Criar usuário via API
  Gerar os dados para o novo usuário

  ${resposta}  Http  url=https://serverest.dev/usuarios
  ...  method=POST
  ...  body={"nome": "${NOME}","email": "${EMAIL}","password": "${SENHA}","administrador": "true"}   

  Should Be Equal As Integers  ${resposta["status"]}  201

Logar com o usuário cadastrado via API
  ${resposta}  Http  url=https://serverest.dev/login
  ...  method=POST
  ...  body={"email": "${EMAIL}","password": "${SENHA}"}
  
  Should Be Equal As Integers  ${resposta["status"]}  200

  LocalStorage Set Item  serverest/userEmail  ${EMAIL}
  LocalStorage Set Item  serverest/userToken  ${resposta["body"]["authorization"]}
  LocalStorage Set Item  serverest/userNome   ${NOME}

  Go To  url=https://front.serverest.dev/admin/home

  Take Screenshot

Cadastrar Usuário e Logar
  Ir para o site Serve Rest Front
  Criar usuário via API
  Logar com o usuário cadastrado via API
  ${STORAGE_FILE}  Save Storage State
  Set Suite Variable  ${STORAGE_FILE}

Abrir o Site Serve Rest Front Logado
  New Browser  browser=${BROWSER}
  ...  headless=${HEADLESS}
  New Context  viewport={'width': 1200, 'height': 800}
  ...  storageState=${STORAGE_FILE}
  New Page   url=https://front.serverest.dev/admin/home
  Get Text   h1  ==  Bem Vindo ${NOME}
  Take Screenshot

Realizar o login com sucesso
  Ir para o site Serve Rest Front
  Fill Text   css=input[data-testid='email']  ${EMAIL}
  Fill Text   css=input[data-testid='senha']   ${SENHA}
  Click   xpath=//*[@id="root"]//button >> text="Entrar"

Gerar informações de produto
  ${NOME_PROD}  FakerLibrary.Word
  ${VALOR_PROD}  FakerLibrary.Random Int  min=1  max=1000
  ${QUANT_PROD}  FakerLibrary.Random Int  min=1  max=100
  Set Suite Variable  ${NOME_PROD}
  Set Suite Variable  ${VALOR_PROD}
  Set Suite Variable  ${QUANT_PROD}
  Set Suite Variable  ${DESCRICAO_PROD}  Produto Teste Automação

Cadastrar um produto
  Gerar informações de produto
  Click  css=a[data-testid='cadastrarProdutos']
  Fill Text  css=input[data-testid='nome']  ${NOME_PROD}
  Fill Text  css=input[data-testid='preco']   ${VALOR_PROD}
  Fill Text  css=textarea[data-testid='descricao']  ${DESCRICAO_PROD}
  Fill Text  css=input[data-testid='quantity']  ${QUANT_PROD}
  Click  text="Cadastrar"

Conferir o produto cadastrado na listagem de produtos
  ${elemento}   Get Table Cell Element  css=table  "Descrição"  "${NOME_PROD}"
  ${descricao}  Get Text  ${elemento}  ==  Produto Teste Automação
  Highlight Elements  ${elemento}
  Take Screenshot   fullPage=${true}