*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Variables ***

${DRIVER_PATH}    C:\\Python39\\driver\\chromedriver-win64\\chromedriver.exe
${URL}            https://ant228.dev.att.com:8443
${PRIORITY_TEXT}  Priority-Queue-Testing
${Network_Element}    Zone Management    #Change this depending on the network element you are testing

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
    Click Element    xpath=//figure[.//div[normalize-space(.)="Network Inventory"]]
    Wait Until Page Contains    Network Inventory    10s

Expand Network Function
    Click Element    xpath=//md-list-item[.//p[normalize-space(.)="${Network_Element}"]]//button[contains(@class,"md-secondary")]
    Wait Until Element Is Visible    xpath=//span[normalize-space(.)="${Zone_Management_Node}"]    10s
