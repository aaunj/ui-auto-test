*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open google chrome
    ${opt}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Comment    Require no sandbox and disable setuid sandbox for support chrome on linux
    Call Method    ${opt}    add_argument    --headless
    Call Method    ${opt}    add_argument    --no-sandbox
    Comment    Call Method    ${opt}    add_argument    --disable-setuid-sandbox
    Comment    Call Method    ${opt}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    chrome_options=${opt}
    Go To    https://ddoc.pea.co.th/login
    Comment    Capture Page Screenshot
    ${result}=    Get Text    /html/body/app-root/px-login/div/div/div[2]/form/div/span

    Log To Console    \n ${result}
    [Teardown]    Close Browser

