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
    Capture Page Screenshot
    Log To Console    \n Multiple arguments
    [Teardown]    Close Browser

