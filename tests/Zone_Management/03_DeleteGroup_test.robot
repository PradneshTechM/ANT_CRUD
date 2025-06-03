*** Settings ***
Library           SeleniumLibrary
Suite Setup       Login Once
Suite Teardown    Close Browser
Resource    ../../Resources/Zone_Management/common.robot
Resource    ../../Resources/Zone_Management/variables.robot

*** Keywords ***
Expand Node Group And Delete Test Group
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]    10s
    Click Element    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]/parent::button/preceding-sibling::md-icon
    Click Element    xpath=//p[normalize-space(.)="${Update_cluster_name}"]/following-sibling::md-icon[@aria-label="Delete"]
    Sleep    5s
    Wait Until Element Is Visible   xpath=//md-dialog-actions//button[.//span[normalize-space(.)="YES"]]
    Click Element    xpath=//md-dialog-actions//button[.//span[normalize-space(.)="YES"]]
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="OK"]]
    Click Element    xpath=//button[.//span[normalize-space(.)="OK"]]

#    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]    10s
#    # click the toggle-icon immediately before the AAA button
#    Click Element    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]/parent::button/preceding-sibling::md-icon
#    # 2) Wait for the row to disappear
#
#    # 3) (Optional) Final sanity check
#    Wait Until Page Does Not Contain Element    xpath=//p[contains(@class,'side-nav-item') and normalize-space(.)='test32']    10s




*** Test Cases ***
Delete Group
    Open Network Inventory
    Expand Network Function
    Expand Node Group And Delete Test Group
