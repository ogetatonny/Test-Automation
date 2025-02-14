*** Settings ***
Documentation       Save tests
Library    AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Variables      ../../Resources/PageObjects/Locators/ClassicSavings.py
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
Open Call deposit when no other save product has been opened
   [Tags]    KE    UG    TZ
    Open call deposit account when there are no other save accounts

open call deposit account when other save accounts are opened
    [Tags]    KE    UG    TZ
    Open call deposit account when there are other save accounts
    view call interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    withraw an amount from the call deposit account    200000

Close opened call deposit account
    [Tags]    KE    UG    TZ
    Open call deposit account when there are other save accounts
    view call interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    close the open call deposit account







