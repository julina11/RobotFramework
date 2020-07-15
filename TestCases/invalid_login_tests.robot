*** Settings ***
Documentation    Checking on all invalid credentials
  
Resource    ../Resources/Base/commonfunctionalities.resource

Test Setup    Start Test
Test Teardown    End Test


*** Test Cases ***
Invalid Credential Test
    Input Text    id=authUser    admin123 
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)    
    Click Element    xpath=//button[@type='submit']
    Page Should Contain    Invalid username or password    