*** Settings ***

Resource  PO/ExpenseReportCreatePage.robot
Resource  CommonWeb.robot


*** Variables ***

*** Keywords ***
Create an Expense Report
    Navigate to Expense
    Find And Click Expense Report
    Click Create Expense Report
    Take Screenshot  ExpenseReportSelection
    Input Purpose And Manager Name
    Click Add Existing Report
    Take Screenshot  ReportMakingPage
    Logout of Application

Input Purpose And Manager Name
    Input Purpose
    Input ManagerName




