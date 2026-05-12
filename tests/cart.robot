*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

*** Keywords ***
Login To Website
    Open Browser    ${URL}    ${BROWSER}

    Input Text    id:user-name    ${USERNAME}
    Input Password    id:password    ${PASSWORD}

    Click Button    id:login-button

    Wait Until Page Contains    Products

*** Test Cases ***
Add Single Item To Cart
    Login To Website

    Click Button    id:add-to-cart-sauce-labs-backpack

    Element Text Should Be
    ...    class:shopping_cart_badge
    ...    1

    Close Browser


Add Multiple Items To Cart
    Login To Website

    Click Button    id:add-to-cart-sauce-labs-backpack

    Click Button    id:add-to-cart-sauce-labs-bike-light

    Element Text Should Be
    ...    class:shopping_cart_badge
    ...    2

    Close Browser


Remove Item From Cart
    Login To Website

    Click Button    id:add-to-cart-sauce-labs-backpack

    Click Button    id:remove-sauce-labs-backpack

    Page Should Not Contain Element
    ...    class:shopping_cart_badge

    Close Browser