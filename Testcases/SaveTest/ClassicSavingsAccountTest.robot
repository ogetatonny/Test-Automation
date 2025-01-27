*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***

Open classic Savings account when no other savings accounts had been opened
    [Tags]    KE   UG  TZ  RW  SS
    Navigate to the save page select classic savings and enter amount    200000
    view classic account terms and conditions
    view classic account feedback display and complete the classic account application

Open classic Savings account when other savings accounts had been opened
   [Tags]    KE  UG  TZ  SS  RW
    open another classic account if there is a preexisting one

Classic Savings Account 1
    [Tags]    KE   UG  TZ  RW  SS
    open classic savings account
    sleep  10s

Classic Savings Account 2
    [Tags]    KE   UG  TZ  RW  SS
    open classic savings account