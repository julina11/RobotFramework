*** Settings ***
Documentation    Validating the valid user credentials
...    for open emr application

Resource    ../Resources/Base/commonfunctionalities.resource
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/DashboardPage.robot

Library    DataDriver    file=../TestData/OpenEMRDataCSV.csv

Test Setup    Start Test
Test Teardown    End Test
Test Template    Valid Credential Template

*** Test Cases ***                      
Valid Credential Test using ${username} and ${password} 

    
*** Keywords ***
Valid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${title}
    Enter Username    ${username}
    Enter Password    ${password}   
    Select Language    ${language}   
    Click Login
    Page Title    ${title}    
    Mouse Over on Name
    Click Logout
   

    