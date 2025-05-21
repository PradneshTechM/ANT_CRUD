*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/PNF/Variables.robot
Resource    ../../Resources/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Keywords ***
Add AAA Entry
    [Documentation]    Click the “+” icon under the AAA row
    Wait Until Element Is Visible    xpath=//ul[@id="subMenuItemsColumn"]//li[.//span[normalize-space(.)="AAA"]]//md-icon[@role="button" and contains(@md-svg-src,"ic_add_box_24px.svg")]    15s
    Click Element                   xpath=//ul[@id="subMenuItemsColumn"]//li[.//span[normalize-space(.)="AAA"]]//md-icon[@role="button" and contains(@md-svg-src,"ic_add_box_24px.svg")]
    Wait Until Page Contains        AAA Details    10s
Fill Out Form
    [Arguments]    ${section_header}    ${label_text}    ${value}
    ${loc1}=    Set Variable    //legend[normalize-space(.)="${section_header}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc1}
    ${loc2}=    Set Variable    ${loc1}/following-sibling::div[1]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc2}
    ${loc3}=    Set Variable    ${loc2}//label[normalize-space(.)="${label_text}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc3}
    ${field_id}=    Get Element Attribute    xpath=${loc3}    for
    Page Should Contain Element    id=${field_id}
    Input Text                   id=${field_id}    ${value}
    Sleep    1s

Dropdown Field
    [Arguments]    ${section_header}    ${dropdown_label}    ${option_value}
    ${label_xpath}=    Set Variable    //legend[normalize-space(.)="${section_header}"]/following-sibling::div//label[normalize-space(.)="${dropdown_label}"]
    ${select_id}=      Get Element Attribute    xpath=${label_xpath}    for
    Click Element      id=${select_id}
    Sleep              3s
    Log To Console    xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @ng-value="dropdown_option" and @aria-hidden="false"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]
    Click Element    xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @ng-value="dropdown_option" and @aria-hidden="false"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]


Save Changes
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="SAVE"]]    10s
    Click Element                   xpath=//button[.//span[normalize-space(.)="SAVE"]]
    Sleep    3s

*** Test Cases ***
Test1 Create Group
    Open Network Inventory
    Expand PNF/VNF Management
    Add AAA Entry

    FOR    ${section}    ${label}     ${value}    IN    @{FILL_FIELDS}
        Fill Out Form    ${section}    ${label}    ${value}
    END

    FOR    ${section}    ${drp}       ${opt}      IN    @{DROP_PROG}
        Dropdown Field    ${section}    ${drp}    ${opt}
    END

    Save Changes