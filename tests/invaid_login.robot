*** settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/ 
${BROWSER}      chrome


*** Test Cases ***

Invalid Login Test
    Open Browser    ${URL}    ${BROWSER}

    Maximize Browser Window

    Input Text    id:user-name  invalid_user

    Input Password    id:password    invalid_password

    Click Button    id:login-button

    Wait Until Page Contains    Epic sadface: Username and password do not match any user in this service    timeout=10s

    Log    Invalid login test passed

    Sleep    3s

    Close Browser