*** Settings ***
Documentation    Validating the valid user credentials
...    for open emr application

Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/DashboardPage.robot

Test Setup    Start Test
Test Teardown    End Test
Test Template    Valid Credential Template

*** Test Cases ***                      username        password        language            expectedtitle
Valid Admin Credential Test             admin           pass            English (Indian)    OpenEMR
Valid Physician Credential Test         physician       physician       English (Indian)    OpenEMR
    
*** Keywords ***
Valid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedtitle}
    Enter Username    ${username}
    Enter Password    ${password}   
    Select Language    ${language}   
    Click Login
    Page Title    ${expectedtitle}    
    Mouse Over on Name
    Click Logout
   

    