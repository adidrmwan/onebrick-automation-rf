*** Settings ***
Resource             library.robot

*** Keywords ***
Open Dashboard Page
    Open Browser    url=https://qademo.onebrick.io/    browser=chrome
    Maximize Browser Window        
    Wait Until Element Is Visible            ${sign_up_title}            timeout=10

Open Login Page
    Open Browser    url=https://qademo.onebrick.io/login    browser=chrome
    Maximize Browser Window        
    Wait Until Element Is Visible            ${login_title}            timeout=10

Click
    [Arguments]        ${elem}
    Wait Until Element Is Visible    ${elem}        timeout=10
    Click Element        ${elem}

Type Text
    [Arguments]        ${elem}        ${text}
    Wait Until Element Is Visible    ${elem}        timeout=10
    Input Text    ${elem}    ${text}

Type Password
    [Arguments]        ${elem}        ${text}
    Wait Until Element Is Visible    ${elem}        timeout=10
    Input Password    ${elem}    ${text}