*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/PNF/Variables.robot
Resource    ../../Resources/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Keywords ***
Add Node
    [Documentation]    Click the “+” icon under the AAA row
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
    Log To Console    ${loc3}
    Input Text                  ${loc3}/following-sibling::input    ${value}
    Sleep    1s

Dropdown Field
    [Arguments]    ${section_header}    ${dropdown_label}    ${option_value}
    ${label_xpath}=    Set Variable    //legend[normalize-space(.)="${section_header}"]/following-sibling::div//label[normalize-space(.)="${dropdown_label}"]
    ${select_id}=      Get Element Attribute    xpath=${label_xpath}    for
    Click Element      id=${select_id}
    Sleep              3s
    Log To Console    xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @role="option"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]
    Click Element    xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @role="option"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]


Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="SAVE"]]    10s
    Click Element                   xpath=//button[.//span[normalize-space(.)="SAVE"]]
    Sleep    3s

*** Test Cases ***
Test1 Create Group
    Open Network Inventory
    Expand Network Function
    Add Node

    FOR    ${section}    ${label}     ${value}    IN    @{Zone_ENTRY_FILL_FIELDS}
        Fill Out Form    ${section}    ${label}    ${value}
    END

    FOR    ${section}    ${drp}       ${opt}      IN    @{Zone_Create_Dropdown_FIELD}
        Dropdown Field    ${section}    ${drp}    ${opt}
    END

    Save Changes