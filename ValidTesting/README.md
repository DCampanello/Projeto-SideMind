# automacao_qualidade_mv

Projeto de Automação WATI/SOUL-MV

### Guia de Práticas diárias com o GIT

Segue abaixo comandos para uso diário para atualizar seu código:

-   Comando para atualizar sua branch com a branch de alguém

    -   git pull origin feature/nome.pessoa

-   Comando para atualizar sua branch com a Master

    -   git pull --set-upstream origin master

-   Comando para subir as atualizações para a sua branch
    -   git push -u origin feature/nome.pessoa

## Configuração de Ambiente Windows

### Instalar e configurar o java jdk

-   Baixar e instalar java jdk 1.8.0 (preferencialmente 1.8.0_271)
    https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html

-   Configurar a variavel de ambiente JAVA_HOME (OBS: em variaveis do sistema)

### Instalar o python

-   Baixar o Python
    https://www.python.org/downloads/

Na instalação marcar a opção ADD PATH na primeira tela

-   Configurar as variaveis de ambiente

-   Adicionar os caminhos na variavel de ambiente path **(OBS: em variaveis do sistema)**<br>
    **Exemplo:**
    C:\Users\seuusuario\AppData\Local\Programs\Python\Python39\
     C:\Users\seuusuario\AppData\Local\Programs\Python\Python39\Scripts\

### Configurando o Ambiente de Automação Windows

-   Abrir o prompt de comando cmd e executar o comnado<br>
    **python --version**
-   Para garantir que o python foi instalado

-   Atualizar o gerenciador de dependências pip com o comando<br>
    **pip install --upgrade pip**

-   Instalar as dependências:<br>
    **pip install robotframework**<br>
    **pip install --upgrade robotframework-seleniumlibrary**<br>
    **pip install robotframework-imagehorizonlibrary**<br>
    **py -m pip install --upgrade pip**
    **pip install selenium robotframework-selenium2library webdrivermanager**
    **pip install robotframework-SikuliLibrary**
    **pip install -U robotframework-databaselibrary**
    ** - instalar drivers: **
    ex:
    webdrivermanager chrome

## Configuração de Ambiente Linux

**OBS: Configuração vai funcionar em qualquer distribuição baseada em Debian ou Ubuntu**

### Instalar e configurar o java jdk

-   Baixar e instalar java jdk 1.8.0 (preferencialmente 1.8.0_271)
    https://www.oracle.com/br/java/technologies/javase/javase-jdk8-downloads.html

-   Configurar a variavel de ambiente JAVA_HOME

### Instalar o python

    https://www.python.org/

### Configurando o Ambiente de Automação Linux

-   Abrir o prompt de comando cmd e executar o comnado<br>
    **python3 --version**<br>
-   Para garantir que o python foi instalado

-   Atualizar o gerenciador de dependências pip com o comando<br>
    **pip3 install --upgrade pip**

-   Instalar as dependências:<br>
    **python3 -m pip install pyautogui**<br>
    **sudo apt-get install scrot**<br>
    **sudo apt-get install python3-tk**<br>
    **sudo apt-get install python3-dev**<br>
    **sudo apt-get install python3-xlib**<br>
    **pip3 install opencv-python**<br>
    **pip3 install robotframework**<br>
    **pip3 install --upgrade robotframework-seleniumlibrary**<br>
    **pip3 install robotframework-imagehorizonlibrary**<br>
    **pip3 install robotframework-imagehorizonlibrary**<br>
    **sudo apt-get update**<br>
    **sudo apt-get upgrade**

### Editor de codigo

-   Sugestão de editor: VSCode

-   Baixar e instalar o VSCode
    https://code.visualstudio.com/download

#### Sugestão de plugins VSCode

    Python (Microsoft)
    Robot Framework Language Server
    RobotF Extension (KMK Labs)


