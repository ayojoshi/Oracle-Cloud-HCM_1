*** Settings ***
Library  Selenium2Library
Library  DateTime
Library  ../Lib/jutil.py
Resource  ../Resources/PO/ExpenseItemCreatePage.robot
Resource  ../Resources/ExpenseItemCreate.robot
Resource  ../Resources/ExpenseReportCreate.robot
Resource  ../Resources/ExpenseApproveCreate.robot

*** Variables ***
${BROWSER} =  firefox
${URL} =  welcome url

# Login Page Objects
${LOGIN_USER} =  id=userid
${LOGIN_PWD} =  id=password
${SIGNIN} =  id=btnActive
${HAMBURGER_MENU} =  xpath=//*[@id="pt1:_UISmmLink"]
${Employee_Email}  = My name and password is
${Employee_Pwd} =   find it out
${Manager_Email} =  still trying !
${Manager_Pwd} =  Try again later


# Signout Page Objects
${USER_NAME_LINK} =  xpath=//*[@id="_FOpt1:_UIScmil1u::icon"]
${SIGN_OUT_LINK} =  xpath=//*[@id="_FOpt1:_UISlg1"]
${SIGN_OUT_CONFIRM_BTN} =  xpath=//button[@id="Confirm"]

*** Keywords ***

# Keywords used for launching and logging into the application
Enter URL
    go to  ${URL}

Enter UserID
    [Arguments]  ${userid}
    input text  ${LOGIN_USER}  ${userid}

Enter Password
    [Arguments]  ${password}
    input password  ${LOGIN_PWD}  ${password}

Click Signin Button
    click button  ${SIGNIN}

Wait For Hamburger Menu
     wait until page contains element  ${HAMBURGER_MENU}  timeout=20s

# Keywords used for logging out of the application

Click on the UserName at the Right Hand Corner
    Wait Dynamically For An Element And Then Click  ${USER_NAME_LINK}

Click Sign Out Link
    sleep  3s
    Wait Dynamically For An Element And Then Click  ${SIGN_OUT_LINK}

Click Confirm Button
    Wait Dynamically For An Element And Then Click  ${SIGN_OUT_CONFIRM_BTN}

# Keywords to be used in Test Cases

Begin Web Test
    open browser  about:blank  ${BROWSER}
    maximize browser window


Login to the Application
    [Arguments]  ${Employee_Email}  ${Employee_Pwd}
    Delete All Cookies
    Enter URL
    Enter UserID   ${Employee_Email}
    Enter Password  ${Employee_Pwd}
    #Take Screenshot  HCMLogin
    Click Signin Button
    Wait For Hamburger Menu
    #Take Screenshot  HCMDashboard


Logout of Application
    sleep  5s
    Click on the UserName at the Right Hand Corner
    #Take Screenshot  LogoutOfApplication
    Click Sign Out Link
    Take Screenshot  LogoutConfirmation
    Click Confirm Button

Login As Manager
    [Arguments]  ${Manager_Email}  ${Manager_Pwd}
    Delete All Cookies
    Enter URL
    Enter UserID  ${Manager_Email}
    Enter Password  ${Manager_Pwd}
    #Take Screenshot  HCMManagerLogin
    Click Signin Button
    Wait For Hamburger Menu
    #Take Screenshot  HCMManagerDashboard

Navigate to Expense
    Click Hamburger Menu
    Click Menu Item Expenses


End Web Test
    close all browsers
    #DISPLAY LOG ONTO BROWSER  ${LOG_FILE}

# Utility Keywords

Wait Dynamically For An Element And Then Click
    [Arguments]  ${locator}
    wait until page contains element  ${locator}  18s
    click element  ${locator}

Fetch Current Date
    [Arguments]  ${format}
    ${x} =  Get Current Date  result_format=${format}
    [Return]  ${x}


Take Screenshot
    [Arguments]  ${fname}
    sleep  2s
    ${x} =  Fetch Current Date  -%m-%d-%Y-%H-%M-%S
    ${name} =   catenate  ${fname}  ${x}
    ${name} =  catenate  ${name}  .png
    Capture Page Screenshot  filename=${OUTPUTDIR}/${name}

Get CSV Data
    [Arguments]  ${filepath}
    ${data} =  read csv file  ${filepath}
    [Return]  ${data}

