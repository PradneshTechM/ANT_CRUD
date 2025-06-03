*** Settings ***
Library           SeleniumLibrary
Suite Setup       Login Once
Suite Teardown    Close Browser
Resource    ../../Resources/PNF/common.robot
Resource    ../../Resources/PNF/Variables.robot

*** Keywords ***
Expand Node Group And Delete Test Group
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${PNF_Management_Node}"]    10s
    Click Element    xpath=//span[normalize-space(.)="${PNF_Management_Node}"]/parent::button/preceding-sibling::md-icon
    Click Element    xpath=//p[normalize-space(.)="${Update_cluster_name}"]/following-sibling::md-icon[@aria-label="Delete"]
    Sleep    5s
    Wait Until Element Is Visible   xpath=//md-dialog-actions//button[.//span[normalize-space(.)="YES"]]
    Click Element    xpath=//md-dialog-actions//button[.//span[normalize-space(.)="YES"]]
    Wait Until Page Does Not Contain Element    xpath=//p[normalize-space(.)="${Update_cluster_name}"]    10s
    Page Should Not Contain Element    xpath=//p[normalize-space(.)="${Update_cluster_name}"]


*** Test Cases ***
Delete Group
    Open Network Inventory
    Expand Network Function
    Expand Node Group And Delete Test Group
