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
    

Check Parking Lot 1
    ${titel}=     Get Title
    Console    ${titel}
    ${parkingStatusBefore}=    Get Text    //body/app-root/div[@class='container']/body/app-parking/div[1]/div[@class='row'][1]/div[@id='11']/div[2]
    Console    \n Parking Lot 1 Status Before : ${parkingStatusBefore}
    Click Element    //div[@class='row'][1]/div[1]/div[3]
    ${parkingStatusAfter}=    //div[@id='11']/div[2]
    Console   \n Parking Lot 1 Status After : ${parkingStatusAfter}
    Should Be True      ${parkingStatusBefore} != ${parkingStatusAfter}
        


Close google chrome
    [Teardown]    Close Browser


*** Keywords ***
Console
    [Arguments]    ${output}
    Log To Console    ${output}