*** Settings ***
Documentation    Page object for handling login page functionalities
Resource    ../Base/commonfunctionalities.resource

*** Variables ***
${NAME LOCATOR}    //span[@data-bind='text:fname']
${LOGOUT LOCATOR}    //li[text()='Logout']

*** Keywords ***
Page Title 
    [Arguments]    ${title}
    Title Should Be    ${title}
    
Mouse Over on Name
    Mouse Over    ${NAME LOCATOR}
    
Click Logout
    Click Element    ${LOGOUT LOCATOR}