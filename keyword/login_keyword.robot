*** Settings ***
Resource             ${EXECDIR}/common/common_keyword.robot
Variables            ${EXECDIR}/object/login_page.py

*** Keywords ***
User Input Email
    [Arguments]        ${input}
    Type Text          ${email_field}        ${input}

User Input Password
    [Arguments]        ${input}
    Type Password      ${password_field}        ${input}

User Click Login Button
    Click               ${login_btn}

User Login
    [Arguments]        ${email}        ${password}
    Open Login Page
    User Input Email            ${email}
    User Input Password         ${password}
    User Click Login Button

Validate User Success Login
    Page Should Contain Element            ${success_info}
    Page Should Contain Element            ${ok_btn}

Prepare Valid Data For Login User
    ${rand_num}=                    Generate Random String       9        [NUMBERS]         
    ${valid_email}=                 Set Variable        testing123@gmail.com
    ${valid_password}=              Set Variable        passwordtesting
    ${invalid_email}=               Set Variable        invaid_email+${rand_num}@gmail.com
    Set Test Variable             ${valid_email}
    Set Test Variable             ${valid_password}
    Set Test Variable             ${invalid_email} 