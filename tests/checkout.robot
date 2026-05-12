*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

*** Test Cases ***
Successful Checkout
    Login And Add Product
    Click Element    class:shopping_cart_link

    Click Button    id:checkout

    Input Text    id:first-name    John
    Input Text    id:last-name     Smith
    Input Text    id:postal-code   12345

    Click Button    id:continue

    Wait Until Page Contains    Checkout: Overview

    Click Button    id:finish

    Wait Until Page Contains
    ...    Thank you for your order!

    Close Browser


Checkout Missing First Name
    Login And Add Product

    Click Element    class:shopping_cart_link

    Click button     id:checkout

    Input Text    id:last-name     Smith
    Input Text    id:postal-code   12345

    Click Button    id:continue

    Wait Until Page Contains
    ...    First Name is required

    Close Browser


Checkout Missing Postal Code
    Login And Add Product

    Click Element    class:shopping_cart_link

    Click Button    id:checkout

    Input Text    id:first-name    John
    Input Text    id:last-name     Smith

    Click Button    id:continue

    Wait Until Page Contains
    ...    Postal Code is required

    Close Browser

Cancel from checkout
    login and add product   
    Click Element     class:shopping_cart_link
    Click Button    id: checkout
    wait until page contains    Checkout: Your Information
    input text    id:first-name    John
    input text    id:last-name     Smith    
    Click Button    id: cancel
    wait until page contains    Your Cart
    Close Browser

*** Keywords ***
Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    # Disable password manager
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    autofill.profile_enabled=${False}
    ...    autofill.credit_card_enabled=${False}

    Call Method
    ...    ${options}
    ...    add_experimental_option
    ...    prefs
    ...    ${prefs}

    # remove automation popup / save password popup
    ${exclude}=    Create List    enable-automation
    Call Method
    ...    ${options}
    ...    add_experimental_option
    ...    excludeSwitches
    ...    ${exclude}

    # Extra arguments
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --guest
    Call Method    ${options}    add_argument    --start-maximized

    Create Webdriver
    ...    Chrome
    ...    options=${options}

Login And Add Product
    Open Chrome Browser

    Go To    ${URL}

    Input Text    id:user-name    ${USERNAME}
    Input Password    id:password    ${PASSWORD}

    Click Button    id:login-button

    Press Keys    NONE    ESC

    Wait Until Page Contains    Products

    Click Button    id:add-to-cart-sauce-labs-backpack