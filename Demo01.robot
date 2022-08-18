*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Open google chrome
    ${opt}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Comment    Require no sandbox and disable setuid sandbox for support chrome on linux
    Call Method    ${opt}    add_argument    --no-sandbox
    Call Method    ${opt}    add_argument    --disable-setuid-sandbox
    Comment    Call Method    ${opt}    add_argument    --proxy-server\=http://localhost:3128
    Comment    Call Method    ${opt}    add_argument    --proxy-server\=http://199.245.56.153:3128
    Create Webdriver    Chrome    chrome_options=${opt}
    Go To    https://sook.dev-thaitrade.com/
    Capture Page Screenshot
    [Teardown]    Close Browser
