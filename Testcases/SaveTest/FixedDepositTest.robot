*** Settings ***
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage


*** Test Cases ***
Open fixed deposit when no other save product is opened
    [Tags]    KE  UG  RW  TZ
    [Documentation]   No reinvesting- A/C left open
    verify user can open fixed deposit account

Open and close fixed deposit when no other save product is opened
    [Tags]    KE  UG  RW  TZ
    [Documentation]    No reinvesting - A/C closed
    verify user can open and close fixed deposit account



#Fixed Deposit Account 3
#    [Tags]    KE  UG  RW  TZ
#    [Documentation]    opened fixed account(reinvesting) - is closed
#    Open fixed deposit account through the reinvest journey
#    check the fixed deposit account information
#    Close the fixed account

#Fixed Deposit Account 4 - reinvesting
#    [Tags]    KE  UG  RW  TZ
#    [Documentation]    opened fixed account(reinvesting) is left unclosed
#    Open fixed deposit account through the reinvest journey
#    check the fixed deposit account information

