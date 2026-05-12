*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${GOOGLE_DRIVE}    https://drive.google.com

*** Test Cases ***
Open Google Drive
    Open Chrome With Profile

    Go To    ${GOOGLE_DRIVE}

    Wait Until Page Contains    My Drive    timeout=15s

    Log    Successfully opened Google Drive

    Sleep    5s

    Close Browser


*** Keywords ***
Open Chrome With Profile
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${userData}=    Set Variable
    ...    --user-data-dir=C:/Users/qwang34@lakeheadu.ca/AppData/Local/Google/Chrome/User Data

    Call Method    ${options}    add_argument    ${userData}

    ${profile}=    Set Variable
    ...    --profile-directory=Default

    Call Method    ${options}    add_argument    ${profile}

    Create Webdriver    Chrome    options=${options}