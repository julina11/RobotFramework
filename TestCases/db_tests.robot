*** Settings ***
Library    DatabaseLibrary    

Suite Setup    Connect To Database    pymysql    dbName=dbfree_db    dbUsername=dbfree_db    dbPassword=12345678    dbHost=db4free.net    dbPort=3306  
Suite Teardown    Disconnect From Database

#IP add 85.10.205.173

*** Variables ***
${USERNAME}    Julina
@{NAMES}    Peter    John    Paul
&{CREDENTIALS}    username=Julina    password=123456


*** Test Cases ***
Print Variable Test
    Log To Console    ${USERNAME}    
    Log To Console     ${NAMES}[0]
    
    FOR    ${name}    IN    @{NAMES}
        Log To Console    ${name}
    END
    
    Log To Console    ${CREDENTIALS}[username]

Check Database
    Check If Exists In Database    select * from country where code='AFG' 
    Check If Not Exists In Database    select * from country where code='AFG'     

Check update and Row count
    Execute Sql String    update country set code ='zzz' where code='AFG' 
    Check If Not Exists In Database    select * from country where code='AFG'  
    
Row Count
    Row Count Is 0    select * from country where 1=2
    Row Count Is Equal To X    select * from country    239
    Row Count Is Greater Than X    select * from country    200    
    Row Count Is Less Than X    select * from country    500    
     
Get Queries
    ${rowcount}    Row Count    select * from country    
    Log To Console    ${rowcount}    
    
    ${result}    Query    select code, name from country where code='zzz'   
    Log To Console    ${result}
    Log To Console    ${result}[0][1]


