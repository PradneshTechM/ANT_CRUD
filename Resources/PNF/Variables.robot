*** Variables ***


##############################******COMMON******######################################################
${Network_Element}    PNF/VNF Management
${DRIVER_PATH}    C:\\Python39\\driver\\chromedriver-win64\\chromedriver.exe
${URL}            https://ant228.dev.att.com:8443
${PRIORITY_TEXT}  Priority-Queue-Testing
##############################******COMMON******######################################################


##############################******CREATE******######################################################

${PNF_Management_Node}    AAA
${Create_cluster_name}    test32
${Update_cluster_name}    test33    #if you don't want to change the cluster name set its value to the same as create_cluster_name
@{FILL_FIELDS}
...    AAA Details       Cluster Name           ${Create_cluster_name}
...    AAA Details       Execution Limit        1
...    AAA Details 1     Name                   test5
...    AAA Details 1     Software Release       test1
...    AAA Details 1     AAA Destination Host   test1
...    DRA Details       DRA SWm IPv6            1::1
...    DRA Details       DRA SWm IPv4            1.1.1.1
...    DRA Details       DRA Destination Host    test1
...    DRA Details       DRA Destination Realm   test1
...    AAA Details 2     Name                   test32
...    AAA Details 2     Software Release       test2
...    AAA Details 2     AAA Destination Host   test2
...    AAA Details 2     DRA SWm IPv6            1::1
...    AAA Details 2     DRA SWm IPv4            1.1.1.1
...    AAA Details 2     DRA Destination Host    test2
...    AAA Details 2     DRA Destination Realm   test2


@{DROP_PROG}
...    AAA Details 1     Deployment Type         Standby
...    AAA Details       Program                 5EC
...    AAA Details       Deployment Mode         AAA_Active_Standby
...    AAA Details 2     Deployment Type         Active
##############################******CREATE******######################################################


##############################******UPDATE******######################################################
@{Update_FIELDS}
...    AAA Details       Cluster Name            ${Update_cluster_name} 
...    AAA Details       Execution Limit         2
...    AAA Details 2     DRA SWm IPv6            3::3
...    AAA Details 2     DRA SWm IPv4            2.2.2.2


@{Check_FIELDS}
...    AAA Details       Cluster Name            test33
...    AAA Details       Execution Limit         2
...    AAA Details 2     DRA SWm IPv6            3::3
...    AAA Details 2     DRA SWm IPv4            2.2.2.2


@{Check_Dropdown}
...    AAA Details 1     Enabled                 NO
...    AAA Details 1     IP Version              IPv6

@{Update_Drop}
...    AAA Details 1       Enabled         NO
...    AAA Details 1       IP Version         IPv6
##############################******UPDATE******######################################################
