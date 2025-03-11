*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot



*** Test Cases ***

Open Goal Savings - No other Save Product Present
    [Documentation]    Manual Top Up 1
    [Tags]    KE    UG    TZ   RW   SS
    Open goal account when there are no other save accounts


Open Goal Savings - Other Save Products Present
    [Documentation]    Manual Top Up 2
    [Tags]    KE    UG    TZ    RW    SS
    Verify user clicks the Open Savings Navigation
    Check that the app can swipe down twice
    Confirm user selects goal category and enters the goal name    Tuition
    check the goal opening amount is keyed in
    Verify screen moves to next page upon clicking continue button
    Confirm user enters the target amount
    Verify screen moves to next page upon clicking continue button
    check that user clicks on continue and views the rates and T&Cs
    Confirm clicking the done button completes opening of the goal account
    swipe the app down to the bottom of the sceen


Edit The Opened Manual Top Up To Recurring Payments
    [Documentation]    Convert to Recurring & close the account
    [Tags]    KE    UG    TZ   RW    SS
    check that user can click the goal card and the manage payments icon    Tuition
    Confirm user clicks the recurring button, enters amount and clicks frequency dropdown
    Verify user successfully enters the start date
    Confirm the end date is entered
    Check that user enters the target date, 45 days from today
    confirm the contiue button is clicked
    Check screen navigates after confirm and edit buttons are clicked
    Close the goal account    Tuition


Open Goal Rucurring Account-Other Save Products Present
    [Documentation]    Open and close Recurring Payments
    [Tags]    KE    UG    TZ    SS
    swipe the app down to the bottom of the sceen
    Confirm user navigates to the open goal button
    Confirm user selects goal category and enters the goal name    Tuition
    check the goal opening amount is keyed in
    Confirm user clicks the recurring button, enters amount and clicks frequency dropdown
    Verify user successfully enters the start date
    Confirm the end date is entered
    Check that user enters the target date, 45 days from today
    confirm the contiue button is clicked
    check that user clicks on continue and views the rates and T&Cs
    Confirm clicking the done button completes opening of the goal account
    Close the goal account    Tuition
    Check that the app can swipe down twice




