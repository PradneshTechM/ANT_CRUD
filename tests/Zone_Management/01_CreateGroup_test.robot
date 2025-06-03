*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/Zone_Management/variables.robot
Resource    ../../Resources/Zone_Management/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Keywords ***
Add Node
    Wait Until Element Is Visible    xpath=//ul[@id="subMenuItemsColumn"]//li[.//span[normalize-space(.)="${Zone_Management_Node}"]]//md-icon[@role="button" and contains(@md-svg-src,"ic_add_box_24px.svg")]    15s
    Click Element                   xpath=//ul[@id="subMenuItemsColumn"]//li[.//span[normalize-space(.)="${Zone_Management_Node}"]]//md-icon[@role="button" and contains(@md-svg-src,"ic_add_box_24px.svg")]
    Sleep    3s
Fill Out Form
    [Arguments]    ${section_header}    ${label_text}    ${value}
    ${loc1}=    Set Variable    //legend[normalize-space(.)="${section_header}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc1}
    ${loc2}=    Set Variable    ${loc1}/following-sibling::div[1]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc2}
    ${loc3}=    Set Variable    ${loc2}//label[normalize-space(.)="${label_text}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc3}
    Input Text                  ${loc3}/following-sibling::input    ${value}
    Sleep    1s

Dropdown Field
    [Arguments]      ${dropdown_label}    ${option_value}
    Click Element      xpath=//label[@for="ntc" and normalize-space(.)="${dropdown_label}"]/following-sibling::md-select[@id="ntc"]
    Sleep              3s
    Click Element        xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @role="option"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]


Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="SAVE"]]    10s
    Click Element                   xpath=//button[.//span[normalize-space(.)="SAVE"]]
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="OK"]]
    Click Element    xpath=//button[.//span[normalize-space(.)="OK"]]
    
Support PNF/VNF
    [Arguments]       ${Available}
    Wait Until Element Is Visible    xpath=//option[normalize-space(.)="${Available}"]
    Click Element    xpath=//option[normalize-space(.)="${Available}"]
    Wait Until Element Is Visible  xpath=//input[@id="btnRight"]
    Click Element    xpath=//input[@id="btnRight"]
    Sleep    2s

Verify Created Group
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]    10s
    Click Element    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]/parent::button/preceding-sibling::md-icon
    Page Should Contain Element    xpath=//p[normalize-space(.)='${Create_cluster_name}']
    Sleep    5s





*** Test Cases ***
Create Group
    Open Network Inventory
    Expand Network Function
    Add Node

    FOR    ${section}    ${label}     ${value}    IN    @{Zone_ENTRY_FILL_FIELDS}
        Fill Out Form    ${section}    ${label}    ${value}
    END

    FOR       ${drp}       ${opt}      IN    @{Zone_Create_Dropdown_FIELD}
        Dropdown Field      ${drp}    ${opt}
    END

    FOR    ${Available}       IN    @{Zone_Available}
        Support PNF/VNF    ${Available}
    END

    Save Changes
#    Verify Created Group
