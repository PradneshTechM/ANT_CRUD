*** Settings ***
Resource    Dropdown_ID.robot
*** Variables ***

##############################******COMMON******######################################################
${DRIVER_PATH}    C:\\Python39\\driver\\chromedriver-win64\\chromedriver.exe
${URL}            https://ant228.dev.att.com:8443
${PRIORITY_TEXT}  Priority-Queue-Testing
##############################******COMMON******######################################################



##############################******DUT Selection******######################################################
@{DUT Type ID}    inputDutType
@{DUT Type PNF_VNF CHOICE ID}     optionPNF_VNF
@{DUT Type Zone CHOICE ID}     optionZone



@{DUT PNF_VNF Dropdown Selection}
...    inputPnfVnf    ${AMF}    AMF
...    inputTrafficTool    ${none}    none
##############################******DUT Selection******######################################################




##############################************PNF/VNF************######################################################
@{type_container_ID}    scriptTypeContainer    
@{type_dropdown_ID}    ${Super Script}
@{type_dropdown_value}    Super Script
@{traffic tool}    trafficToolInputContainerSave    
@{PNF_VNF script_type_container_ID}        scriptInputContainerSave
@{PNF_VNF script_type_dropdown_ID}    ${Nodal_Api_CallBased}    
@{PNF_VNF script_type_dropdown_value}    Nodal_Api_CallBased


@{PNF_VNF test_case_description}
...     testCaseDescriptionInputContainer                      Superscript which supports Nodal API CallBased Test execution for test32


@{PNF_VNF Text Input}
...    testCaseNameInputContainer    test32             None
...    hpqcTestPlanIDChipsContainer            HPQC-12345         None
...    sendEmailToOthersChipsContainer                 pk0952@att.com     testCaseInfoLegend

@{PNF_VNF predefined list}
...     API CallBased
...     Provisioning
...     xyz123
...     Nodal Test Cases
...     E2E Test Cases
...     Nodal Performance Test

@{PNF_VNF test_access_control_id}
...    allowAllRadioButton
...    allowOwnerRadioButton
...    allowOthersRadioButton
##############################************PNF/VNF************######################################################





##############################************Zone************######################################################
@{Zone script_type_id}        scriptInputContainerSave
@{Zone script_type_selection}    Log Capture Script
@{DUT Zone Dropdown Selection}
...     inputZoneType    BlackBird
...     selectZone    BBRDM8_1A
...     inputSpgwNetwork    NDC2CSVC3GW01
...    inputTrafficTool    None


@{Zone predefined list}
...     NF Log Capture (AMF, SMF, PCF, MME, SPGW)
...     NGxP Log Capture
...     xyz123
...     Nodal Test Cases
...     E2E Test Cases
...     Nodal Performance Test


@{Zone Text Input}
...    testCaseNameInputContainer    test32             None
...    hpqcTestPlanIDChipsContainer            HPQC-12345         None
...    sendEmailToOthersChipsContainer                 pk0952@att.com     testCaseInfoLegend


@{Zone test_access_control_id}
...    allowOthersRadioButton

@{Zone test_case_description}
...     testCaseDescriptionInputContainer                      Superscript which supports Nodal API CallBased Test execution for test32



##############################************Nodal_API_Callbased_Tabs************######################################################
@{Scenario Selection}    Scenario Selection
@{Server Details}    Server Details
@{PayLoad Command Builder}    PayLoad Command Builder 
@{NF Log Capture}    NF Log Capture 
@{Validation Points}    Validation Points
@{Time Out}    Time Out


##############################************Nodal_API_Callbased_Dropdown************######################################################
@{Scenario Dropdown}    dropInputContainer_test_type    dropOption_test_type_0

@{Server Details Dropdown}
...    dropInputContainer_jumper    ${Via OpenTool}   Via OpenTool 
...    dropInputContainer_ConnectingServer    ${DUT_Zone_PNF}    DUT_Zone_PNF
...    dropInputContainer_gatewayIp    ${21.2.2.1}    21.2.2.1
...    dropInputContainer_gnInterface    ${ens01}    ens01

@{PayLoad Command Builder Dropdown}
...    dropInputContainer_0_0    ${Default}    Default
...     dropInputContainer_0_2    ${GET}    GET
...     dropInputContainer_0_13   ${Payload_None}    None
...     dropInputContainer_0_14    ${No}    No

@{NF Log Capture Dropdown}
...    dropInputContainer_0_0     ${NF_none}    none

@{Validation Points Dropdown}
...     dropInputContainer_0_0     ${Validation_None}    None
##############################************Nodal_API_Callbased_Dropdown************######################################################

