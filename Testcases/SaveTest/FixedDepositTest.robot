*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage


*** Test Cases ***
Fixed Deposit Account 1 - no reinvesting
    [Tags]    KE  UG  RW  TZ
    Open fixed deposit account without the reinvest journey
    check the fixed deposit account information
    Close the fixed account
    sleep   10s

Fixed Deposit Account 2 - reinvesting
    [Tags]    KE  UG  RW  TZ
    Open fixed deposit account with the reinvest journey
    check the fixed deposit account information
    Close the fixed account