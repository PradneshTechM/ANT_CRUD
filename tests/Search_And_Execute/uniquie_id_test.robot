*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/Search_and_execute/variables.robot
Resource    ../../Resources/Search_and_execute/common.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Keywords ***
Select Option From Dropdown
    [Arguments]    ${container_id}    ${option_text}
    Wait Until Element Is Visible    xpath=//*[@id='${container_id}']//md-select    timeout=60s
    Click Element                   xpath=//*[@id='${container_id}']//md-select
    Wait Until Element Is Visible   xpath=//md-option[normalize-space(.)='${option_text}']    timeout=10s
    Click Element                   xpath=//md-option[normalize-space(.)='${option_text}']
    Sleep    1s
    Click Element                   xpath=//body    

Select LineUp Option
    [Arguments]    ${option_text}    ${value}
    Click Element                   xpath=//*[@id='lineUpsContainer']//md-select
    Wait Until Element Is Visible   xpath=//span[normalize-space(text())='${option_text}']/preceding-sibling::md-icon    timeout=10s
    Click Element                   xpath=//span[normalize-space(text())='${option_text}']/preceding-sibling::md-icon
    Wait Until Element Is Visible   xpath=//md-option[normalize-space(.)='${value}']    timeout=10s
    Click Element                   xpath=//md-option[normalize-space(.)='${value}']
    Sleep    1s
    Click Element                   xpath=//body
    
Click Apply Button
    Wait Until Element Is Visible    xpath=//*[@id='applyForSummary']    timeout=10s
    Click Element                    xpath=//*[@id='applyForSummary']
    Sleep    5s
    Log       ✅ Search and Execute successfully applied.


*** Test Cases ***
Unique ID
    Open Network Inventory
    
    FOR    ${container}    ${value}    IN    @{programContainer}
        Select Option From Dropdown    ${container}    ${value}
    END

    FOR    ${container}    ${value}     IN     @{Lineup_Container}
        Select LineUp Option    ${container}    ${value}
    END

    FOR    ${container}    ${value}    IN    @{toolsContainer}
        Select Option From Dropdown    ${container}    ${value}
    END

    FOR    ${container}    ${value}    IN    @{labelContainer}
        Select Option From Dropdown    ${container}    ${value}
    END

    FOR    ${container}    ${value}    IN    @{categoryContainer}
        Select Option From Dropdown    ${container}    ${value}
    END

    FOR    ${container}    ${value}    IN    @{gppScenariosContainer}
        Select Option From Dropdown    ${container}    ${value}
    END
    Click Apply Button

