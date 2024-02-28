*** Settings ***
Library     SeleniumLibrary
Library     AutoRecorder
Library     Collections
Resource    ../2-pages/TestSideMind_Page.robot


*** Keywords ***
Abrir o Navegador
    Open Browser    browser=chrome

Fechar o Navegador
    Close Browser

## Metodos de Processos

Clicar no item
    [Arguments]                      ${elemento}
    Wait Until Element Is Visible    ${elemento}     120
    Click Element                    ${elemento}

Preencher campo
    [Arguments]    ${elemento}    ${valor}
    Wait Until Element Is Visible    ${elemento}    180
    Click Element    ${elemento}
    Sleep    1
    Wait Until Element Is Enabled    ${elemento}    5
    Sleep    0.3
    Input Text    ${elemento}    ${valor}
    FOR    ${i}    IN RANGE    1    11
        Sleep    1
        ${textoAtual}    Get Element Attribute    ${elemento}    value
        # ${textoAtual}    Get Text    ${elemento}
        IF    "${textoAtual}" == "${valor}"
            Exit For Loop
        ELSE IF    "${textoAtual}" != "${valor}"
            IF    "${i}" == "${10}"
                Log To Console    *** Falha ao tentar preencher o campo ${elemento}
                Log    *** Falha ao tentar preencher o campo ${elemento}
                Capture Page Screenshot
                Fail    *** Falha ao tentar preencher o campo ${elemento}
            ELSE
                Input Text    ${elemento}    ${valor}
            END
        END
    END

Clicar no Campo e Preencher Informacao
    [Arguments]    ${CampoClick}    ${CampoEditavel}    ${DadoInserido}
    Wait Until Element Is Visible    ${DivLoading}    120
    Click no Item    ${CampoClick}
    Sleep    1
    Preencher Campo    ${CampoEditavel}    ${DadoInserido}

Click no Item
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}    120
    Sleep    1
    Click Element    ${elemento}
    Sleep    1

## Metodos Para Validação
Validar Elemento Pelo Titulo
    [Arguments]                      ${titulo}       ${timeout}=${60}
    ${elemento}                      Set Variable    xpath=//h1[contains(text(),"${titulo}")]
    Sleep    5
    Wait Until Element Is Visible    ${elemento}     ${timeout}                                  O elemento ${elemento} não foi carregado
    Element Should Be Visible        ${elemento}
    Capture Page Screenshot

Valida item apontado
    [Arguments]                      ${element}
    Wait Until Element Is Visible    ${element}     120
    Element Should Be Visible        ${element}
    Capture Page Screenshot

Verifica Inclusao de Item no Carrinho
    [Documentation]    Metodo adicionado para validação de produto no carrinho
    [Arguments]    ${produto}
    ${lista_produto}    set Variable     xpath=//tr[@class='cart_item']
    ${nome_produto}     Set Variable     xpath=//a[contains(text(),"${produto}")]

    IF    ${lista_produto} == True
        Wait Until Element Is Visible    ${nome_produto}    30
        Element Should Be Enabled        ${nome_produto}
        Capture Page Screenshot
    ELSE
        Wait Until Element Is Visible    ${btn_return-to-shop}    30
        Log To Console                   *** não há produtos cadastrados ***
        Clicar no item                   ${btn_return-to-shop}
    END
    


## Processos de testes da pagina
Acessar Site
    [Documentation]    Processo de acesso ao Site
    Go To    ${url}
    Maximize Browser Window
    Wait Until Element Is Visible    ${painel}    120

Seleciona Setor Site
    [Documentation]    Processo de acesso ao Site
    [Arguments]    ${nome_setor}
    ${setor}    Set Variable    xpath=//ul[@id='main-nav']//a[contains(text(),"${nome_setor}")]
    Wait Until Element Is Visible    ${setor}
    Clicar no item                   ${setor}

Seleciona Produto Por Titulo
    [Documentation]    Processo de seleção do produto clicando no nome
    [Arguments]    ${item_produto}
    ${seleciona_produto}    Set Variable     xpath=//h3[contains(text(),"${item_produto}")]
    ${titulo_produto}       Set Variable     xpath=//div//h1[contains(text(),"${item_produto}")]
    Wait Until Element Is Visible    ${seleciona_produto}    30
    Clicar no item                   ${seleciona_produto}
    Validar Elemento Pelo Titulo     ${item_produto}
    Clicar no item                   ${btn_add_to_basket}
    Valida item apontado             ${btn_add_to_basket}

Seleciona Produto por Botao "Add to Basket"
    [Documentation]    Processo para a inclusão do produto pelo botão "Add to Basket"
    [Arguments]    ${item_produto}
    ${seleciona_produto}    Set Variable    xpath=//h3[contains(text(),"${item_produto}")]/../..//a[@data-product_id]
    ${link_wiew-basket}     Set Variable    xpath=//h3[contains(text(),"${item_produto}")]/../..//a[@data-product_id]/..//a[@title]
    Wait Until Element Is Visible    ${seleciona_produto}    30
    Clicar no item                   ${seleciona_produto}
    Wait Until Element Is Visible    ${link_wiew-basket}     30
    Element Should Be Visible        ${link_wiew-basket}
    Capture Page Screenshot


Consultar Carrinho e Iniciar CheckOut
    [Documentation]    Processo Para finalização do produto inclusp no carrinho
    [Tags]    Listagem
    [Arguments]    ${produto}
    Wait Until Element Is Visible            ${layout_carrinho}    30
    Verifica Inclusao de Item no Carrinho    ${produto}
    Clicar no item                           ${btn_proced-to-checkout}

Preencher informacoes do CheckOut
    [Documentation]    Processo para preenchimento do dados obrigatorios do checkout
    [Tags]    dados    cadastro
    [Arguments]    ${fname}    ${lname}    ${email}    ${phone}    ${country}    ${adress}    ${state}    ${town}    ${zip-code}
    
    ${list_country}    Set Variable    xpath=//div[@class='select2-result-label']//span[contains(text(),"${country}")]
    ${list_state}      Set Variable    xpath=//div[@class='select2-result-label']//span[contains(text(),"${state}")]
    

    Clicar no Campo e Preencher Informacao    ${txt_first-name}      ${txt_first-name}       ${fname}
    Clicar no Campo e Preencher Informacao    ${txt_last-name}       ${txt_last-name}        ${lname}
    Clicar no Campo e Preencher Informacao    ${txt_email}           ${txt_email}            ${email}
    Clicar no Campo e Preencher Informacao    ${txt_phone}           ${txt_phone}            ${phone}
    Clicar no Campo e Preencher Informacao    ${btn_country}         ${txt_country}          ${country}
    Click no Item                             ${list_country}
    Clicar no Campo e Preencher Informacao    ${txt_adress}          ${txt_adress}           ${adress}
    Clicar no Campo e Preencher Informacao    ${btn_state/county}    ${txt_state/county}     ${state}
    Click no Item                             ${list_state}
    Clicar no Campo e Preencher Informacao    ${txt_town/city}       ${txt_town/city}        ${town}
    Clicar no Campo e Preencher Informacao    ${txt_postcode}        ${txt_postcode}         ${zip-code}
    Click no Item                             ${btn_place-order}
    Valida item apontado                      ${element-sucess}