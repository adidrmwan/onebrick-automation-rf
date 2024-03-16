*** Settings ***
Resource             ${EXECDIR}/common/common_keyword.robot
Variables            ${EXECDIR}/object/dashboard_page.py

*** Keywords ***
User Input First Name
    [Arguments]        ${input}
    Type Text          ${first_name_field}        ${input}

User Input Last Name
    [Arguments]        ${input}
    Type Text          ${last_name_field}        ${input}

User Input Email
    [Arguments]        ${input}
    Type Text          ${email_field}        ${input}

User Input Phone Number
    [Arguments]        ${input}
    Type Text          ${phone_number_field}        ${input}

User Input Address
    [Arguments]        ${input}
    Type Text          ${address_field}        ${input}

User Input Password
    [Arguments]        ${input}
    Type Password          ${password_field}        ${input}

User Input Confirm Password
    [Arguments]        ${input}
    Type Password          ${confirm_password_field}        ${input}

User Click Register Button
    Click    ${register_btn}

Prepare Valid Data For Register User
    ${rand_num}=                    Generate Random String       9        [NUMBERS]         
    ${valid_first_name}=            FakerLibrary.first_name
    ${valid_last_name}=             FakerLibrary.last_name
    ${valid_address}=               Set Variable        Jl. Bunga Anggrek no 21
    ${valid_phone_number}=          Set Variable        +628${rand_num}
    ${valid_email}=                 Set Variable        ${valid_first_name}.${valid_last_name}.${rand_num}@example.com
    ${invalid_email}=               Set Variable        ${valid_first_name}.${valid_last_name}.${rand_num}
    ${valid_password}=              Set Variable        Password!2${valid_first_name}+${rand_num}
    Set Test Variable             ${valid_first_name}
    Set Test Variable             ${valid_last_name}
    Set Test Variable             ${valid_address}
    Set Test Variable             ${valid_phone_number}
    Set Test Variable             ${valid_email}
    Set Test Variable             ${valid_password}
    Set Test Variable             ${invalid_email} 

User Register
    [Arguments]        ${first_name}        ${last_name}        ${email}        ${phone_number}        ${address}        ${password}        ${confirm_password}
    Open Dashboard Page
    User Input First Name            ${first_name}
    User Input Last Name             ${last_name}
    User Input Email                 ${email}
    User Input Phone Number          ${phone_number}
    User Input Address               ${address}
    User Input Password              ${password}
    User Input Confirm Password      ${confirm_password}
    User Click Register Button

Validate User See Success Message
    Page Should Contain Element          ${success_info}
    Page Should Contain Element          ${ok_btn}

Validate User See Error Message on ${string}
    Run Keyword If    '${string}' == 'first_name'                  Page Should Contain Element          ${first_name_error}
    ...    ELSE IF    '${string}' == 'last_name'                   Page Should Contain Element          ${last_name_error}
    ...    ELSE IF    '${string}' == 'email'                       Page Should Contain Element          ${email_error}
    ...    ELSE IF    '${string}' == 'password'                    Page Should Contain Element          ${password_error}
    ...    ELSE IF    '${string}' == 'confirm_password'            Page Should Contain Element          ${confirm_password_error}
    ...    ELSE IF    '${string}' == 'password_less_than'          Page Should Contain                  Please enter at least 6 characters.
    ...    ELSE IF    '${string}' == 'password_not_match'          Page Should Contain                  Password need to match
    ...    ELSE IF    '${string}' == 'existing_email'              Page Should Contain                  Email has been taken!
    ...    ELSE IF    '${string}' == 'invalid_email'               Page Should Contain                  Please enter a valid email address.