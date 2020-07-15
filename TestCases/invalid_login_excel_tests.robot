*** Settings ***
Documentation    Checking on all invalid credentials
  
Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot

Library    DataDriver    file=../TestData/OpenEMRData.xlsx    sheet_name=Invalid Credential Test

Test Setup    Start Test
Test Teardown    End Test
Test Template    Invalid Credential Template


*** Test Cases ***
Invalid Credential Test using ${username} and ${password}
    
*** Keywords ***
Invalid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    
    Enter Username    ${username} 
    Enter Password    ${password}   
    Select Language    ${language}    
    Click Login    
    Page Should Contain    Invalid username or password    