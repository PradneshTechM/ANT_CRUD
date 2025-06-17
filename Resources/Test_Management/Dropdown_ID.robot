*** Variables ***
##############################******DUT PNF_VNF Dropdown Selection******######################################################
${AAA}    optionPnfVnf-0
${AMF}    optionPnfVnf-1
${AMF_Set}    optionPnfVnf-2
${AUS}    optionPnfVnf-3
${BDC}    optionPnfVnf-4
${BSF}    optionPnfVnf-5
${BSF_Set}    optionPnfVnf-6
${CALEA}    optionPnfVnf-7
${CGF}    optionPnfVnf-8
${CHF}    optionPnfVnf-9
${COR_SGI_FW_OAM}    optionPnfVnf-10
${CPM}    optionPnfVnf-11
${eMBMS_GW}    optionPnfVnf-12
${EPDG}    optionPnfVnf-13
${Example}    optionPnfVnf-14
${EXiN}    optionPnfVnf-15
${FIFiW}    optionPnfVnf-16
${FirewallPOO}    optionPnfVnf-17
${FNCR}    optionPnfVnf-18
${fnSBC}    optionPnfVnf-19
${FOFiW}    optionPnfVnf-20
${FRWL}    optionPnfVnf-21
${GMLC}    optionPnfVnf-22
${GW_OAM}    optionPnfVnf-23
${IMHSS}    optionPnfVnf-24
${Infrastructure}    optionPnfVnf-25
${Jump_Server}    optionPnfVnf-26
${K8sCluster}    optionPnfVnf-27
${LMF}    optionPnfVnf-28
${Load_Balancer}    optionPnfVnf-29
${MME_Pool}    optionPnfVnf-30
${MOG}    optionPnfVnf-31
${MOG}    optionPnfVnf-32
${MSF}    optionPnfVnf-33
${MSP}    optionPnfVnf-34
${MSP_VMT}    optionPnfVnf-35
${NEF}    optionPnfVnf-36
${NGxP}    optionPnfVnf-37
${NRF}    optionPnfVnf-38
${NSSF}    optionPnfVnf-39
${OAM_FW}    optionPnfVnf-40
${Ookla}    optionPnfVnf-41
${OPM}    optionPnfVnf-42
${PAS}    optionPnfVnf-43
${PAS-PAIR}    optionPnfVnf-44
${PCF}    optionPnfVnf-45
${PCRF}    optionPnfVnf-46
${pCSCF}    optionPnfVnf-47
${pCTS}    optionPnfVnf-48
${pMRF}    optionPnfVnf-49
${PSBC}    optionPnfVnf-50
${Router}    optionPnfVnf-51
${SAEGW_CP}    optionPnfVnf-52
${SAEGW_UP}    optionPnfVnf-53
${SCP}    optionPnfVnf-54
${SEPP}    optionPnfVnf-55
${SMF}    optionPnfVnf-56
${SMLC}    optionPnfVnf-57
${SMS}    optionPnfVnf-58
${SMSC}    optionPnfVnf-59
${SMSF}    optionPnfVnf-60
${SPGW}    optionPnfVnf-61
${UDSF}    optionPnfVnf-62
${UDR}    optionPnfVnf-63
${UDSF}    optionPnfVnf-64
${UPF}    optionPnfVnf-65
${vCCX}    optionPnfVnf-66
${vCSCF}    optionPnfVnf-67
${vLCSG}    optionPnfVnf-68
${vMRF}    optionPnfVnf-69
${VNF}    optionPnfVnf-70
${VNF Cluster}    optionPnfVnf-71
${VNF_Cluster}    optionPnfVnf-72
${vPAS}    optionPnfVnf-73
${vUDF}    optionPnfVnf-74
${VSBC}    optionPnfVnf-75
##############################******DUT PNF_VNF Dropdown Selection******######################################################


##############################******DUT Traffic Tool Type Dropdown Selection******######################################################
${simulated}    optionSimulated
${real}    optionReal
${hybrid}    optionHybrid
${none}    optionNone
##############################******DUT Traffic Tool Type Dropdown Selection******######################################################


##############################******Type Dropdown Selection******######################################################
${Super Script}    superScriptOption
${Scenario}    scenarioOption
##############################******Type Dropdown Selection******######################################################


##############################******Script Dropdown Selection******######################################################
${CLI_HealthCheck}    scriptOptionSave_0
${Nodal_Api_CallBased}    scriptOptionSave_1
##############################******Script Dropdown Selection******######################################################


##############################******Scenario Type Dropdown Selection******######################################################
${API Call Based}    dropOption_test_type_0
##############################******Scenario Dropdown Selection******######################################################

##############################******Server Details Connecting Server Dropdown Selection******######################################################
${Via ATE}    dropOption_jumper_0
${Via OpenTool}    dropOption_jumper_1
${Via Other Connecting VM}    dropOption_jumper_2
##############################******Server Details Connecting Servers Dropdown Selection******######################################################


##############################******Server Details Connecting Server Name Dropdown Selection******######################################################
${123_OpenTool_Demo}          dropOption_ConnectingServer_0
${A M F 5}                    dropOption_ConnectingServer_1
${clone_test}                 dropOption_ConnectingServer_2
${Demo}                       dropOption_ConnectingServer_3
${Demo_1}                     dropOption_ConnectingServer_4
${Demo_1_clone123}            dropOption_ConnectingServer_5
${Demo_clone}                 dropOption_ConnectingServer_6
${DUT}                        dropOption_ConnectingServer_7
${DUT_PNF}                    dropOption_ConnectingServer_8
${DUT_Zone_PNF}           dropOption_ConnectingServer_9
${Test_server}            dropOption_ConnectingServer_10
${Test_Server_1}          dropOption_ConnectingServer_11
${Test_Server_12}         dropOption_ConnectingServer_12
${TP_DsTest}              dropOption_ConnectingServer_13
##############################******Server Details Connecting Server Name Dropdown Selection******######################################################


##############################******Server Details GN Gateway IP Dropdown Selection******######################################################
${21.2.2.1}      dropOption_gatewayIp_0
${4::1}          dropOption_gatewayIp_1
##############################******Server Details GN Gateway IP Dropdown Selection******######################################################


##############################******Server Details GN interface Dropdown Selection******######################################################
${ens01}        dropOption_gnInterface_0
${ens01v6}      dropOption_gnInterface_1
##############################******Server Details GN interface Dropdown Selection******######################################################


###############################***** Payload Command Builder Command Name Dropdown Selection *****###############################
${Default}         dropOption_0_0_0
${Step_Delay}      dropOption_0_1_0
###############################***** Payload Command Builder Command Name Dropdown Selection *****###############################


###############################***** Payload Command Builder Command Type Dropdown Selection *****###############################
${DELETE}      dropOption_0_0_2
${GET}         dropOption_0_1_2
${PATCH}       dropOption_0_2_2
${POST}        dropOption_0_3_2
${PUT}         dropOption_0_4_2
###############################***** Payload Command Builder Command Type Dropdown Selection *****###############################

###############################***** Payload Command Builder Command Dependency Dropdown Selection *****###############################
${LAST_CMD_FAILED}      dropOption_0_0_13
${LAST_CMD_PASSED}      dropOption_0_1_13
${Payload_None}                 dropOption_0_2_13
###############################***** Payload Command Builder Command Dependency Dropdown Selection *****###############################

###############################***** Payload Command Builder Post Processing Dropdown Selection *****###############################
${No}       dropOption_0_0_14
${Yes}      dropOption_0_1_14
###############################***** Payload Command Builder Post Processing Dropdown Selection *****###############################

###############################***** NF LOG Capture NF NODE Dropdown Selection *****###############################
${NF_none}    select_container_1227
###############################***** NF LOG Capture NF NODE Dropdown Selection *****###############################

###############################*****Validation points Validation Type  Dropdown Selection *****###############################
${Validation_None}    dropOption_0_0_0