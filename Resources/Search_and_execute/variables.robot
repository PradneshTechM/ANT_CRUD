*** Variables ***

##############################******COMMON******######################################################
${DRIVER_PATH}    C:\\Python39\\driver\\chromedriver-win64\\chromedriver.exe
${URL}            https://ant228.dev.att.com:8443
${PRIORITY_TEXT}  Priority-Queue-Testing
##############################******COMMON******######################################################


@{programContainer}
...    programContainer         BlackBird

@{toolsContainer}
...    toolsContainer           Ixia

@{labelContainer}
...    labelContainer           42153

@{categoryContainer}
...    categoryContainer        E2E Test Cases

@{gppScenariosContainer}
...    gppScenariosContainer    3-way Call


@{Lineup_Container}
...     BlackBird    BBRDM8_1A
