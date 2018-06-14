*** Settings ***
Library  Selenium2Library
#Resource  ../Resources/CommonWeb.robot

*** Variables ***
${ITEM_TRAVEL_AND_EXPENSES} =  xpath= //*[@id="_FOpt1:_FOr1:0:_FOSritemNode_my_information_expenses:0:_FOTsr1:0:pt0:AP1:cl1"]
${ITEM_APPROVE_REPORTS} =  xpath=//*[@id="_FOpt1:_FOr1:0:_FOSritemNode_my_information_expenses:0:_FOTsr1:1:pt0:pt1:r1:0:ITPdc2j_id_2:ITPsh2:0:pt1:pgl2"]
${ITEM_REPORT_TO_APPROVE} =  xpath=//*[@id="_FOpt1:_FOr1:0:_FOSritemNode_my_information_expenses:0:_FOTsr1:1:pt0:pt1:r1:0:ITPdtl:1:lv4:0:panelGridLayout13"]/div[10]
${ITEM_APPROVE_REPORT} =  xpath=//*[@id="_FOpt1:_FOr1:0:_FOSritemNode_my_information_expenses:0:_FOTsr1:1:pt0:pt1:r1:0:ITPdtl:1:commandToolbarButton3"]/a


*** Keywords ***

Go To Travel And Expenses
    sleep  5s
    wait dynamically for an element and then click   ${ITEM_TRAVEL_AND_EXPENSES}

Navigate To Approve Reports
    sleep  5s
    wait dynamically for an element and then click   ${ITEM_APPROVE_REPORTS}

Select And Approve Report
    sleep  5s
    wait dynamically for an element and then click   ${ITEM_REPORT_TO_APPROVE}
    sleep  5s
    wait dynamically for an element and then click   ${ITEM_APPROVE_REPORT}
