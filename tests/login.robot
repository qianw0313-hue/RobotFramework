*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome

*** Test Cases ***
Successful Login
    Open Browser    ${URL}    ${BROWSER}

    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce

    Click Button    id:login-button

    Wait Until Page Contains    Products

    Page Should Contain    Products

    Close Browser


Invalid Login
    Open Browser    ${URL}    ${BROWSER}

    Input Text    id:user-name    wrong_user
    Input Password    id:password    wrong_password

    Click Button    id:login-button

    Wait Until Page Contains
    ...    Epic sadface

    Close Browser


Empty Password
    Open Browser    ${URL}    ${BROWSER}

    Input Text    id:user-name    standard_user

    Click Button    id:login-button

    Wait Until Page Contains
    ...    Password is required

    Close Browser