*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/Test_Management/variables.robot
Resource    ../../Resources/Test_Management/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Keywords ***
DUT Type Dropdown    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//md-select    timeout=60s
    Click Element                   xpath=//*[@id='${container_id}']//md-select
    Sleep    1s
    Wait Until Element Is Visible       xpath=//md-option[@id='${option_text}']
    Click Element                    xpath=//md-option[@id='${option_text}']
    Sleep    1s
    Click Element                   xpath=//body

DUT selection Dropdown
    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//md-select    timeout=60s
    Click Element                   xpath=//*[@id='${container_id}']//md-select
    Wait Until Element Is Visible   xpath=//md-option[normalize-space(.)='${option_text}']    timeout=10s
    Click Element                   xpath=//md-option[normalize-space(.)='${option_text}']
    Sleep    1s
    Click Element                   xpath=//body

Test case Input
    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']    timeout=60s
    Click Element         xpath=//*[@id='${container_id}']
    Input Text    xpath=//*[@id='${container_id}']//input     ${option_text}
    Press Keys    xpath=//*[@id='${container_id}']//input    ENTER

predefined list
    [Arguments]      ${option_text}
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)='${option_text}']/ancestor::*[self::button or self::md-list-item]    timeout=10s
    Click Element                    xpath=//span[normalize-space(.)='${option_text}']/ancestor::*[self::button or self::md-list-item]



Click Apply Button
    Wait Until Element Is Visible    xpath=//*[@id='createIcon']    timeout=10s
    Click Element                    xpath=//*[@id='createIcon']
    Sleep    2s


*** Test Cases ***
Unique ID
    Open Network Inventory

    DUT Type Dropdown    ${DUT Type}[0]    ${DUT Type}[1]

    FOR    ${container}    ${value}    IN    @{DUT Dropdown Selection}
        DUT selection Dropdown    ${container}    ${value}
    END

    Click Apply Button

    FOR    ${container}    ${value}    IN    @{Text Input}
        Test case Input    ${container}    ${value}
    END

    FOR      ${value}    IN    @{predefined list}
        predefined list    ${value}
    END

