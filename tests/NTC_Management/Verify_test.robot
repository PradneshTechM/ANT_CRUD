*** Settings ***
Library           SeleniumLibrary
Suite Setup       Login Once
Suite Teardown    Close Browser
Resource    ../../Resources/NTC_Management/common.robot
Resource    ../../Resources/NTC_Management/variables.robot

*** Keywords ***
Expand Group And Locate Test Group
    [Arguments]    
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${NTC_Management_Node}"]    10s
    Click Element    xpath=//span[normalize-space(.)="${NTC_Management_Node}"]
    Click Element    xpath=//p[normalize-space(.)="${Cluster_name}"]

    Sleep    5s
    
Verify Cluster
    [Arguments]    ${node}    ${Test}
    ${locator}=    Set Variable    xpath=//li[.//p[normalize-space(.)='${node}']]/ul//li/p[normalize-space(.)='${Test}']
    ${found}=      Run Keyword And Return Status    Page Should Contain Element    ${locator}    5s
    Run Keyword If    ${found}
    ...    Log To Console    ✅ Cluster “${Test}” found under “${node}”
    ...    ELSE
    ...    Fail    ❌ Cluster “${Test}” **NOT** found under “${node}”


*** Test Cases ***
Verify test
    Open Network Inventory
    Expand Network Function
    Expand Group And Locate Test Group
    Verify Cluster    ${node_name}    ${Test_group}


