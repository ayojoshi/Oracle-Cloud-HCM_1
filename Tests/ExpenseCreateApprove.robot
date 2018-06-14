*** Settings ***
Documentation  This script is used to create an Expense item, Expense Report and Approve an Expense Report
Resource  ../Resources/ExpenseItemCreate.robot
Resource  ../Resources/ExpenseReportCreate.robot
Resource  ../Resources/ExpenseApproveCreate.robot
Library  ../Lib/jutil.py

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

${DATA_PATH} =  C:\\developments\\robot-scripts\\Oracle-Cloud-HCM\\Data\\data.csv

*** Test Cases ***

Employee Should Be Able To Creates An Expense Item
    [Documentation]  This Test Creates An Employee Expense Item In Oracle HCM
    [Tags]  Expense
     CommonWeb.Login to the Application  ${Employee_Email}  ${Employee_Pwd}
     ExpenseItemCreate.Create an Expense Item

Employee Should Be Able To Create An Expense Report
    [Documentation]  This script is used to create an Expense Report in Oracle HCM
    [Tags]  Smoke
     CommonWeb.Login to the Application  ${Employee_Email}  ${Employee_Pwd}
     ExpenseReportCreate.Create an Expense Report


Line Manager Should Be Able To Approve An Expense Report
    [Documentation]  This script is used to Approve an Expense Report in Oracle HCM
    [Tags]  Smoke
     CommonWeb.Login As Manager   ${Manager_Email}  ${Manager_Pwd}
     ExpenseApproveCreate.Approve Expense Report

