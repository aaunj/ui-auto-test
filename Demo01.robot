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
    Go To    http://prod.sandbox-me.com/
    Comment    Capture Page Screenshot
    [Teardown]    Close Browser
    

Check Parking Lot 1
    Sleep   20sec
    ${titel}=     Get Text    //html/body/app-root/div[@class='container']/body/h1
    Console    ${titel}
    ${parkingStatusBefore}=    Get Text    //div[@id='11']/div[2]
    Console    \n Parking Lot 1 Status Before : ${parkingStatusBefore}
    Click Element    //div[@class='row'][1]/div[1]/div[3]

    Sleep   20sec
    ${parkingStatusAfter}=    Get Text    //div[@id='11']/div[2]
    Console   \n Parking Lot 1 Status After : ${parkingStatusAfter}
    Should Be True      ${{'${parkingStatusBefore}' != '${parkingStatusAfter}'}}

*** Keywords ***
Console
    [Arguments]    ${output}
    Log To Console    ${output}