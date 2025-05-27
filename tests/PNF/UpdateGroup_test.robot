*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/PNF/Variables.robot
Resource    ../../Resources/PNF/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser

*** Keywords ***
Expand AAA Group And Locate Test Group
    # wait for the AAA row to show up
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${PNF_Management_Node}"]    10s
    # click the toggle-icon immediately before the AAA button
    Click Element    xpath=//span[normalize-space(.)="${PNF_Management_Node}"]/parent::button/preceding-sibling::md-icon
    # wait for one of the child entries (e.g. AMF) to appear
    Click Element    xpath=//p[normalize-space(.)="${Create_cluster_name}"]/following-sibling::md-icon[contains(@class,"editClass")]
    Sleep    5s

Update Field In Section
    [Arguments]    ${section_header}    ${label_text}    ${value}
    ${loc1}=    Set Variable    //legend[normalize-space(.)="${section_header}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc1}
    ${loc2}=    Set Variable    ${loc1}/following-sibling::div[1]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc2}
    ${loc3}=    Set Variable    ${loc2}//label[normalize-space(.)="${label_text}"]
    Run Keyword And Continue On Failure    Page Should Contain Element    xpath=${loc3}
    Input Text                  ${loc3}/following-sibling::input    ${value}
    Sleep    1s

Update Dropdown Field
    [Arguments]    ${section_header}    ${dropdown_label}    ${option_value}
    ${label_xpath}=    Set Variable    //legend[normalize-space(.)="${section_header}"]/following-sibling::div//label[normalize-space(.)="${dropdown_label}"]
    ${select_id}=      Get Element Attribute    xpath=${label_xpath}    for
    Click Element      id=${select_id}
    Sleep              3s
    Click Element    xpath=//div[@class="md-select-menu-container multiSelectHeader md-active md-clickable"]//md-option[@value="${option_value}" and @ng-value="dropdown_option" and @aria-hidden="false"]/div[@class="md-text ng-binding" and normalize-space(.)="${option_value}"]

UPDATE Changes
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="UPDATE"]]    10s
    Click Element    xpath=//button[.//span[normalize-space(.)="UPDATE"]]
    Wait Until Element Is Visible    xpath=//button[.//span[normalize-space(.)="OK"]]
    Click Element    xpath=//button[.//span[normalize-space(.)="OK"]]
    Sleep    5s

Check Fields After Update
    [Arguments]    ${section_header}    ${label_text}    ${expected_value}
    # 1) Find the header span
    ${header_xpath}=    Set Variable    //span[normalize-space(.)="${section_header}"]
    Wait Until Element Is Visible    xpath=${header_xpath}    10s
    # 2) Climb up to its legend and down into the section container
    ${container_xpath}=    Set Variable    ${header_xpath}/ancestor::legend/following-sibling::div
    Wait Until Element Is Visible    xpath=${container_xpath}    10s
    # 3) Find the exact label inside that container
    ${label_xpath}=    Set Variable    //legend[normalize-space(.)="${section_header}"]/following-sibling::div//label[normalize-space(.)="${label_text}"]
    Wait Until Element Is Visible    xpath=${label_xpath}    10s
    # 4) Pull its generated “for” attribute (the input’s ID)
    ${field_id}=    Get Element Attribute    xpath=${label_xpath}    for
    ${actual}=     Get Value               id=${field_id}

    Run Keyword If    '${actual}' == '${expected_value}'
    ...    Log To Console    ✅ [${section_header}] ${label_text} matches expected: ${actual}
    ...    ELSE
    ...    Log To Console    ❌ [${section_header}] ${label_text} mismatch – expected: ${expected_value}, actual: ${actual}

    # Always assert at the end so the test fails if they differ
    Should Be Equal    ${actual}    ${expected_value}

Check Dropdown After Update    [Arguments]    ${section_header}    ${label_text}    ${expected_value}
    # your label xpath from before
     # 1) Find the <label> for your dropdown
    ${label_xpath}=    Set Variable    //legend[normalize-space(.)="${section_header}"]/following-sibling::div//label[normalize-space(.)="${label_text}"]
    Wait Until Element Is Visible    xpath=${label_xpath}    10s

    # 2) From that label descend into the md-select and into the md-text/ng-binding div
    ${text_xpath}=    Set Variable    ${label_xpath}/following-sibling::md-select//div[contains(@class,"md-text") and contains(@class,"ng-binding")]

    # 3) Grab its text
    ${selected}=    Get Text    xpath=${text_xpath}

    Run Keyword If    '${selected}' == '${expected_value}'
    ...    Log To Console    ✅ [${section_header}] ${label_text} matches expected: ${selected}
    ...    ELSE
    ...    Log To Console    ❌ [${section_header}] ${label_text} mismatch – expected: ${expected_value}, actual: ${selected}

    # Always assert at the end so the test fails if they differ
    Should Be Equal    ${selected}    ${expected_value}









*** Test Cases ***
Update Group
    Open Network Inventory
    Expand Network Function
    Expand AAA Group And Locate Test Group
    FOR    ${section}    ${label}     ${value}    IN    @{Update_FIELDS}
        Update Field In Section    ${section}    ${label}    ${value}
    END
    FOR    ${section}    ${label}     ${value}    IN    @{Update_Drop}
        Update Dropdown Field    ${section}    ${label}    ${value}
    END
    UPDATE Changes
#    FOR    ${section}    ${label}     ${value}    IN    @{Check_FIELDS}
#        Check Fields After Update        ${section}    ${label}    ${value}
#    END
#    FOR    ${section}    ${label}     ${value}    IN    @{Check_Dropdown}
#        Check Dropdown After Update        ${section}    ${label}    ${value}
#    END

