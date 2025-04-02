# Automação de Testes Web com Robot Framework + Playwright (Library Browser) + Execução no GitHub Actions

Este repositório contém os arquivos de exemplos e desafios de exercícios desenvolvidos durante o curso de [Robot Framework com Playwright e GitHub Actions](https://www.udemy.com/course/robot-framework-com-playwright-e-github-actions), ministrado por Mayara "May" Fernandes. 

## 📚 Sobre o Curso

Este curso é voltado para profissionais que já possuem conhecimentos básicos em **Robot Framework** e desejam aprimorar suas habilidades na automação de testes web utilizando a **Browser Library**, baseada no **Playwright**.

Durante as aulas, são abordadas técnicas avançadas para automação de testes web, comparações entre as bibliotecas **Browser Library** e **SeleniumLibrary**, além da implementação de **integração contínua (CI/CD) com GitHub Actions**.

---

## 🛠️ Tecnologias Utilizadas

- **Python** → Linguagem de programação base para o Robot Framework.  
- **Git e GitHub** → Controle de versão e compartilhamento de código.  
- **Visual Studio Code** → IDE utilizada para desenvolvimento.  
- **Robot Framework** → Framework de automação de testes.  
- **Node.js** → Ambiente de execução necessário para o Playwright.  
- **Browser Library** → Biblioteca para automação de testes web baseada no Playwright.  
- **GitHub Actions CI/CD** → Integração contínua para automação de testes em pipelines.  

---

## 📁 Conteúdo do Repositório  
1. **Estrutura do Repositório e Descrição das Pastas:**

- **tests_web/** → Contém os scripts de automação para testes de interface web utilizando **Robot Framework** com **BrowserLibrary**.  
  - **resources/** → Arquivos auxiliares, como **variáveis, keywords reutilizáveis e configurações de ambiente**, evitando duplicação de código.  
  - **tests/** → Casos de teste automatizados escritos em **Robot Framework** (.robot), organizados conforme os cenários de teste web.  
  - **resultados/** → Logs, relatórios e evidências gerados após a execução dos testes.  

- **Outros Arquivos Importantes:**  
  - **requirements.txt** → Lista de dependências do projeto para instalação rápida.  
  - **.gitignore** → Lista de arquivos e diretórios que devem ser ignorados pelo Git.  
  - **README.md** → Documentação do projeto, incluindo instruções de instalação e execução dos testes.  

2. **GitHub Actions Workflow:**

- **testing_ci_workflow.yml** → Este arquivo define o fluxo de trabalho de integração contínua (CI) utilizando o GitHub Actions para executar testes automatizados com Robot Framework. Este workflow é acionado automaticamente em cada push ou pull request para a branch main.

- **manual_testing_ci_workflow.yml** → Este arquivo configura o fluxo de trabalho de Integração Contínua (CI) no GitHub Actions, permitindo a execução manual dos testes diretamente pela interface do GitHub Actions. Ideal para quando se deseja controlar a execução dos testes de forma personalizada.

- ***Descrição:***
  - O workflow é responsável por rodar os testes automatizados tanto para testes web quanto para testes de API.
  - Inclui etapas como checkout do código, instalação de dependências, execução de testes, upload e download de resultados, e publicação do sumário dos testes no GitHub.
  - Ele é configurado para rodar de forma automática sempre que houver um push para o repositório, garantindo que os testes sejam executados de forma contínua.

---

## 🤖 Como Executar os Testes

### 🔧 Pré-requisitos

1. **Instalar o Python (versão 3.7 ou superior)** → [Download do Python](https://www.python.org/downloads/)  
2. **Instalar o Node.js** → [Download do Node.js](https://nodejs.org/en/download/)  
3. **Instalar as dependências do projeto**
   ```bash
   pip install -r requirements.txt
   ```
4. **Instalar dependências do Playwright**
   ```bash
   npm install @playwright/test
   npx playwright install-deps
   ```
5. **Seguir instruções adicionais para a instalação da [Browser Library](https://robotframework-browser.org/)**

### 📊 Executando os Testes

1. **Clone o repositório**
   ```bash
   git clone https://github.com/sthefanyricardo/curso-robot-framework-com-playwright-may.git
   ```
2. **Navegue até a pasta do projeto**
   ```bash
   cd curso-robot-framework-com-playwright-may/tests_web
   ```
3. **Execute os testes com os comandos abaixo**
   - **Executar todos os testes**:
     ```bash
     robot -d resultados tests/
     ```
   - **Executar testes específicos**:
     ```bash
     robot -d resultados -i CT01ORCT04 tests/
     ```
   - **Executar os testes em modo headless** (sem interface gráfica):
     ```bash
     robot -d resultados -v HEADLESS:true tests/
     ```
   - **Executar os testes a partir de um outro navegador**:
     ```bash
     robot -d resultados -v BROWSER:firefox tests/
     ```
4. **Verifique os resultados da execução**
   - Os relatórios e logs serão gerados na pasta `resultados/`.

---

## 📌 Agradecimentos

- À instrutora **May Fernandes** pelo curso e compartilhamento de conhecimento.
- À comunidade de automação de testes por todo o suporte e inspiração.
- **Observações:**  
  - Este repositório é destinado a fins educacionais para demonstrar conceitos de automação de testes com Robot Framework.  
  - Sinta-se à vontade para clonar, modificar e utilizar este código como base para seus próprios projetos.  

## 🙋‍♀️ Autora

Feito com ❤️ por **Sthefany A. Ricardo**.  
📅 Última atualização: **Abril de 2025**.