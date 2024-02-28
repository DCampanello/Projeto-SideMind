*** Settings ***
Resource    ../1-resources/TestSideMind_Resources.robot


*** Variables ***
${url}                          https://practice.automationtesting.in/
${painel}                       xpath=//h2[contains(.,'new arrivals')]

## Botoes
${btn_add_to_basket}            xpath=//button[@class='single_add_to_cart_button button alt']
${btn_carrinho}                 xpath=//li[@id='wpmenucartli']//a
${btn_return-to-shop}           xpath=//a[@class='button wc-backward']
${btn_proced-to-checkout}       xpath=//a[@class='checkout-button button alt wc-forward']
${btn_country}                  xpath=//div[@id='s2id_billing_country']//a
${btn_state/county}             xpath=//div[@class='select2-container state_select']//a
${btn_place-order}              xpath=//input[@id='place_order']

## Input
${txt_first-name}               xpath=//input[contains(@name,'billing_first_name')]
${txt_last-name}                xpath=//input[contains(@name,'billing_last_name')]
${txt_email}                    xpath=//input[@type='email'][contains(@id,'email')]
${txt_phone}                    xpath=//input[@type='tel'][contains(@id,'phone')]
${txt_country}                  xpath=//input[contains(@aria-owns,'select2-results-1')]
${txt_state/county}             xpath=//div[@class='select2-search'][contains(.,'State / County *')]//input
${txt_adress}                   xpath=//input[contains(@name,'billing_address_1')]
${txt_town/city}                xpath=//input[@type='text'][contains(@id,'city')]
${txt_postcode}                 xpath=//input[@type='text'][contains(@id,'postcode')]

## Genericos
${layout_carrinho}              xpath=//div[@id='content']
${layout_Checkout}              xpath=//h3[contains(.,'Billing Details')]
${DivLoading}                   xpath=//div[@id='layout']
${element-sucess}               xpath=//p[@class='woocommerce-thankyou-order-received']
