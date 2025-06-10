*** Variables ***

##############################******COMMON******######################################################
${DRIVER_PATH}    C:\\Python39\\driver\\chromedriver-win64\\chromedriver.exe
${URL}            https://ant228.dev.att.com:8443
${PRIORITY_TEXT}  Priority-Queue-Testing
##############################******COMMON******######################################################

##############################******DUT Selection******######################################################
@{DUT Type}
...    inputDutType    optionPNF_VNF



@{DUT Dropdown Selection}
...    inputPnfVnf    AMF
...    inputTrafficTool    None
##############################******DUT Selection******######################################################



##############################******Creating Test Case******######################################################
@{Text Input}
#...    testCaseNameInputContainer    test32
#...    httpName                      Superscript which supports Nodal API CallBased Test execution for test32
...     hpqcTestPlanIDForm    HPQC-12345
...     sendEmailToOthersChipsContainer    pk0952@att.com
@{predefined list}
#...     API CallBased
#...     Provisioning
...     xyz123
...     Nodal Test Cases
...     E2E Test Cases
...     Nodal Performance Test
##############################******Creating Test Case******######################################################
