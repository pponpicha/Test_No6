*** Settings ***
Library    Selenium2Library
Test Teardown   Close All Browsers
Resource   dataTest/var.robot

***Keywords***
go to herokuapp
    Open Browser    ${URL}    ${browser}

***Test Cases ***
Login success
    go to herokuapp
    Element Should Contain    class:example    Login Page
    input text    id:username      ${usernameValid}
    input text    id:password      ${passwordValid}
    click element    class:radius
    Wait Until Element Is Visible    id:flash
    Element Should Contain    id:flash    You logged into a secure area!
    Click Link    /logout
    Wait Until Element Is Visible    id:flash
    Element Should Contain    id:flash    You logged out of the secure area!

Login failed-Password incorrect
    go to herokuapp
    Element Should Contain    class:example    Login Page
    input text    id:username      ${usernameValid}
    input text    id:password      ${passwordInvalid}
    click element    class:radius
    Wait Until Element Is Visible    id:flash
    Element Should Contain    id:flash    Your password is invalid!

Login failed-Username not found
    go to herokuapp
    Element Should Contain    class:example    Login Page
    input text    id:username      ${usernameInvalid}
    input text    id:password      ${passwordInvalid}
    click element    class:radius
    Wait Until Element Is Visible    id:flash
    Element Should Contain    id:flash    Your username is invalid!

                   