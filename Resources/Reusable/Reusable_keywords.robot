*** Settings ***
Library          SeleniumLibrary


*** Keywords ***
DUT Type Dropdown    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//md-select    timeout=60s
    Click Element                   xpath=//*[@id='${container_id}']//md-select
    Sleep    1s
    Wait Until Element Is Visible       xpath=//md-option[@id='${option_text}']
    Click Element                    xpath=//md-option[@id='${option_text}']
    Sleep    1s
    Click Element                   xpath=//body


Dropdown
    [Arguments]    ${container_id}    ${ID}    ${value}

    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//md-select    timeout=60s
    Click Element                    xpath=//*[@id='${container_id}']//md-select
    Sleep    1s

    Wait Until Element Is Visible    xpath=//md-option[@id='${ID}' and @value='${value}']    timeout=10s
    Click Element                    xpath=//md-option[@id='${ID}' and @value='${value}']

    Sleep    1s
    Click Element    xpath=//body
    Sleep    2s


Test case Input
    [Arguments]    ${container_id}    ${option_text}    ${scroll_target}=None
    IF    '${scroll_target}' != 'None'
        Scroll Element Into View    xpath=//*[@id='${scroll_target}']
    END
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//input    timeout=60s
    Click Element         xpath=//*[@id='${container_id}']//input
    Input Text    xpath=//*[@id='${container_id}']//input     ${option_text}
    Press Keys    xpath=//*[@id='${container_id}']//input    ENTER
    Sleep    1s


Test case Description Input
    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']    timeout=60s
    Click Element         xpath=//*[@id='${container_id}']
    Input Text    xpath=//*[@id='${container_id}']//textarea     ${option_text}
    Press Keys    xpath=//*[@id='${container_id}']//textarea    ENTER
    Sleep    1s


predefined list
    [Arguments]      ${option_text}
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)='${option_text}']/ancestor::*[self::button or self::md-list-item]    timeout=10s
    Click Element                    xpath=//span[normalize-space(.)='${option_text}']/ancestor::*[self::button or self::md-list-item]
    Sleep    1s

Send email to test creator button
    Wait Until Element Is Visible    xpath=//*[@id='sendEmailToCreatorCheckbox']//span    timeout=10s
    Click Element                    xpath=//*[@id='sendEmailToCreatorCheckbox']
    Sleep    2s

Test Access Control Button
    [Arguments]      ${ID}
    Wait Until Element Is Visible       xpath=//md-radio-button[@id='${ID}']
    Click Element    xpath=//md-radio-button[@id='${ID}']
    Sleep    2s


Click Apply Button
    Wait Until Element Is Visible    xpath=//*[@id='createIcon']    timeout=10s
    Click Element                    xpath=//*[@id='createIcon']
    Sleep    2s

Nodal API Script Tabs
    [Arguments]    ${ID}
    Wait Until Element Is Visible    xpath=//span[contains(normalize-space(.), '${ID}')]

    Click Element       xpath=//span[contains(normalize-space(.), '${ID}')]

    Sleep    5s
