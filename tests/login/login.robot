*** Settings ***
Resource             ${EXECDIR}/keyword/login_keyword.robot

Test Setup           Prepare Valid Data For Login User
Test Teardown        Close Browser

*** Test Cases ***
User Succes Login
    [Tags]            login        positive
    User Login        ${valid_email}        ${valid_password}
    Validate User Success Login

User Failed Login Using Invalid Email
    [Tags]            login        negative
    User Login        ${invalid_email}        ${valid_password}
    Validate User See Error Message invalid_email

User Failed Login Using Not Existing Email
    [Tags]            login        negative
    User Login        ${not_existing_email}        ${valid_password}
    Validate User See Error Message not_existing_email

User Failed Login Using Wrong Password
    [Tags]            login        negative
    User Login        ${valid_email}        ${wrong_password}
    Validate User See Error Message wrong_password