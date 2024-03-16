*** Settings ***
Resource             ${EXECDIR}/keyword/register_keyword.robot

Test Setup           Prepare Valid Data For Register User
Test Teardown        Close Browser

*** Test Cases ***
User Succes Register        
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Success Message

User Succes Register with Blank Address     
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${EMPTY}        ${valid_password}        ${valid_password}
    Validate User See Success Message

User Failed Register using blank first_name        
    User Register        ${EMPTY}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Error Message on first_name

User Failed Register using blank last_name
    User Register        ${valid_first_name}        ${EMPTY}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Error Message on last_name

User Failed Register using blank email
    User Register        ${valid_first_name}        ${valid_last_name}        ${EMPTY}        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Error Message on email

User Failed Register using blank password
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${EMPTY}        ${valid_password}
    Validate User See Error Message on password

User Failed Register using blank confirm_password
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${EMPTY}
    Validate User See Error Message on confirm_password

User Failed Register using password less than 6 characters
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        pass        ${valid_password}
    Validate User See Error Message on password_less_than

User Failed Register with confirm_password didn't match with password
    User Register        ${valid_first_name}        ${valid_last_name}        ${valid_email}        ${valid_phone_number}        ${valid_address}        ${valid_password}        password
    Validate User See Error Message on password_not_match

User Failed Register using Existing Email
    User Register        ${valid_first_name}        ${valid_last_name}        asd@asd.com        ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Error Message on existing_email

User Failed Register using Invalid Email
    User Register        ${valid_first_name}        ${valid_last_name}        ${invalid_email}                ${valid_phone_number}        ${valid_address}        ${valid_password}        ${valid_password}
    Validate User See Error Message on invalid_email