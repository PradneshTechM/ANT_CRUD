*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot


*** Keywords ***
Login Once
    Open Browser    ${URL}    Chrome    executable_path=${DRIVER_PATH}
    Maximize Browser Window
    Wait Until Element Is Visible    id=desktop_dropdown_button    10s
    Click Element                    id=desktop_dropdown_button
    Wait Until Element Is Visible    id=WindowsAccountSelectId    5s
    Click Element                    id=WindowsAccountSelectId
    Wait Until Element Is Visible    id=windowsSubmit               5s
    Click Element                    id=windowsSubmit
    Wait Until Page Contains         ${PRIORITY_TEXT}              60s

Open Network Inventory
    Sleep    5s
    Click Element    xpath=//figure[.//div[normalize-space(.)="Search and Execute"]]
