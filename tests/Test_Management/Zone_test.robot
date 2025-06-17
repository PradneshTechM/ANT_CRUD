*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/Test_Management/variables.robot
Resource    ../../Resources/Test_Management/common.robot
Resource    ../../Resources/Reusable/Reusable_keywords.robot
Suite Setup      Login Once
Suite Teardown   Close Browser


*** Test Cases ***
Zone Test Case Management
    Open Network Inventory
    
    DUT Type Dropdown    @{DUT Type ID}    @{DUT Type Zone CHOICE ID}

    FOR    ${container}    ${value}    IN    @{DUT Zone Dropdown Selection}
        Dropdown    ${container}    ${value}
    END

    Click Apply Button

    Dropdown    @{Zone script_type_id}    @{Zone script_type_selection}


    FOR        ${value}    IN    @{Zone test_access_control_id}
        Test Access Control Button     ${value}
    END

    FOR    ${container}    ${value}    IN    @{Zone test_case_description}
        Test case Description Input    ${container}    ${value}
    END

    FOR    ${container_id}    ${option_text}    ${scroll_target}    IN    @{Zone Text Input}
        Test case Input    ${container_id}    ${option_text}    ${scroll_target}
    END


    FOR      ${value}    IN    @{Zone predefined list}
        predefined list    ${value}
    END

    Send email to test creator button
