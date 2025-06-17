*** Settings ***
Library          SeleniumLibrary
Resource    ../../Resources/Test_Management/variables.robot
Resource    ../../Resources/Test_Management/common.robot
Resource    ../../Resources/Reusable/Reusable_keywords.robot
Suite Setup      Login Once
Suite Teardown   Close Browser

*** Test Cases ***
PNF_VNF Test Case Management
    Open Network Inventory
    DUT Type Dropdown    @{DUT Type ID}    @{DUT Type PNF_VNF CHOICE ID}


    FOR    ${container}    ${ID}    ${value}    IN    @{DUT PNF_VNF Dropdown Selection}
        Dropdown    ${container}    ${ID}    ${value}
    END

    Click Apply Button

    Dropdown    @{type_container_ID}    @{type_dropdown_ID}    @{type_dropdown_value}

    Dropdown    @{PNF_VNF script_type_container_ID}    @{PNF_VNF script_type_dropdown_ID}    @{PNF_VNF script_type_dropdown_value}



#
#    FOR        ${value}    IN    @{PNF_VNF test_access_control_id}
#        Test Access Control Button     ${value}
#    END
#
#    FOR    ${container}    ${value}    IN    @{PNF_VNF test_case_description}
#        Test case Description Input    ${container}    ${value}
#    END
#
#    FOR    ${container_id}    ${option_text}    ${scroll_target}    IN    @{PNF_VNF Text Input}
#        Test case Input    ${container_id}    ${option_text}    ${scroll_target}
#    END
#
#
#    FOR      ${value}    IN    @{PNF_VNF predefined list}
#        predefined list    ${value}
#    END
#
#    Send email to test creator button
#
    
#    Nodal API Script Tabs    @{Scenario Selection}
#
#    FOR    ${container}    ${value}    IN    @{Scenario Dropdown}
#        Dropdown    ${container}    ${value}
#    END
#
#    Nodal API Script Tabs    @{Server Details}
#
#    FOR    ${container}    ${value}    IN    @{Server Details Dropdown}
#        Dropdown    ${container}    ${value}
#    END

    Nodal API Script Tabs    @{PayLoad Command Builder}

    FOR    ${container}    ${ID}    ${value}    IN    @{PayLoad Command Builder Dropdown}
        Dropdown    ${container}    ${ID}    ${value}
    END

#    Nodal API Script Tabs    @{Validation Points}
#
#    Nodal API Script Tabs    @{Time Out}

