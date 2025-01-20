*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
#1. open call deposit account when no other save accounts are opened
#    [Tags]    KE  UG  TZ  SS  RW
#    Navigate to the save page select call deposit and enter amount    150000
#    view call interest rates and the terms and conditions
#    view call deposit feedback display and complete the application

Classic Savings Account 1
    [Tags]    KE   UG  TZ  RW  SS
    open classic savings account
    sleep  10s

Classic Savings Account 2
    [Tags]    KE   UG  TZ  RW  SS
    open classic savings account

#Open classic Savings account when no other savings accounts had been opened
#    Navigate to the save page select classic savings and enter amount    200000
#    view classic account terms and conditions
#    view classic account feedback display and complete the classic account application

#Open classic Savings account when other savings accounts had been opened
#   [Tags]    KE  UG  TZ  SS  RW
#    open another classic account if there is a preexisting one
   # recurring payment blocker - the button to submit the request after the dates and frequency is greyed out

Fixed Deposit Account 1
    [Tags]    KE  UG  RW  TZ  SS
    Open fixed deposit account
    sleep   10s
Fixed Deposit Account 2
    [Tags]    KE  UG  RW  TZ  SS
    Open fixed deposit account
