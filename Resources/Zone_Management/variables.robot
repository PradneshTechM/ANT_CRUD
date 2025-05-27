*** Variables ***
${Create_cluster_name}    test32
${Update_cluster_name}    test32    #if you don't want to change the cluster name set its value to the same as create_cluster_name
${Zone_Management_Node}    5EC
${Network_Element}    Zone Management
##############################******CREATE******######################################################
@{Zone_ENTRY_FILL_FIELDS}
...    Zone Details    Name                   ${Create_cluster_name}
...    Zone Details    Release                  5
...    Zone Details       Execution Limit        1
...    Access Details     Project ID           test
...    Access Details    Network URL            https://testlocal
...    Access Details    Port URL               https://testlocal
...    Access Details     Server URL        https://testlocal
...    Access Details     Hypervisor URL    https://testlocal
...    Access Details     Flavor URL        https://testlocal
...    Access Details     URL for Token     https://testlocal
...    Access Details     User Name     test
...    Access Details     Password     test1

@{Zone_Create_Dropdown_FIELD}
...    NTC Name             ALLNTX
...    PNF/VNF Type         vPAS

@{Zone_Available}
...    dcdjkb

##############################******CREATE******######################################################



##############################******UPDATE******######################################################

@{Update_FIELDS}
...    Zone Details       Execution Limit        2
...    Access Details    Network URL            https://testlocal2
...    Access Details     Server URL        https://testlocal3
...    Access Details     User Name     test2


@{Update_Drop}
...    NTC Name         ALPSGA
...    PNF/VNF Type         vPAS

@{Update_Zone_Available}
...    PAS

@{Check_FIELDS}
...    Zone Details       Execution Limit        2
...    Access Details    Network URL            https://testlocal2
...    Access Details     Server URL        https://testlocal3
...    Access Details     User Name     test2


@{Check_Dropdown}
...    NTC Name         ALPSGA

@{PNF_VNF_Check}
...    PNF/VNF Details         VPAS

##############################******UPDATE******######################################################
