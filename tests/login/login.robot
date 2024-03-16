*** Settings ***
Resource             ${EXECDIR}/keyword/login_keyword.robot

Test Setup           Prepare Valid Data For Login User
Test Teardown        Close Browser

*** Test Cases ***
User Succes Login       
    User Login        ${valid_email}        ${valid_password}
    Validate User Success Login