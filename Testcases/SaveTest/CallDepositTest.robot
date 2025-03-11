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


Open Call Deposit And Withdraw Amount Leaving The Call Balance Below Documented Limit
    [Documentation]    Account closes if balance is < Documented Limit
    [Tags]    KE    UG    TZ
    Verify user clicks the Open Savings Navigation
    Confirm user clicks the open call button, enters amount, submits
    view interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    Verify user successfully selects the call account card
    check that the call account closes if withdrawal leaves call balance with less than 50000


Open Call Deposit And Withdraw Amount Leaving The Call Balance Above Documented Limit
    [Documentation]    Balance Rolls Over To Autocreated Call Account
    [Tags]    KE    UG    TZ
    Verify user clicks the Open Savings Navigation
    Confirm user clicks the open call button, enters amount, submits
    view interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    Verify user successfully selects the call account card
    check that the withdrawal rolls over the balance to an autocreated call account


Open And Close The Call Deposit Account
    [Tags]    KE    UG    TZ
    Verify user clicks the Open Savings Navigation
    Confirm user clicks the open call button, enters amount, submits
    view interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    Verify user successfully selects the call account card
    close the call deposit account







