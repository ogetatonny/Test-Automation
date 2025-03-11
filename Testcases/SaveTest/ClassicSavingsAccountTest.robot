*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource   ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
Open Classic Savings Account - No other Save A/C Present
    [Documentation]    Manual Top Up
    [Tags]    KE    UG
    Verify classic savings opens successfully

Open Classic savings - Other Save A/Cs Present
    [Documentation]    Manual Top Up
    [Tags]    KE    UG
    Confirm user clicks classic open button, enters amount, submit
    confirm classic terms and conditions are attached
    verify the classic account opening completes successfully
    Check that the opened classic account card is clickable


Edit The Manual Top Up to Recurring Payment
    [Documentation]    Conversion To Daily Payments
    [Tags]    KE    UG
    confirm the manage payment icon and add recurring payment button is clicked
    Verify That User Selects The Daily Frequency
    Confirm the recurring amount is keyed in
    Verify user successfully enters the start date
    Confirm the end date is entered
    user click on the continue and done button to complete the transaction


Open Daily Recurring Classic - Other Save A/Cs present
    [Documentation]    Open Standalone Daily Payments
    [Tags]    KE    UG
    Confirm that user clicks on the open savings navigation and enters amount
    Check that Recurring journey is selectable
    Verify That User Selects The Daily Frequency
    Confirm the recurring amount is keyed in
    Verify user successfully enters the start date
    Confirm that user enters Last payment date and completes the transaction successfully

Open Weekly Classic Account - Other Save A/Cs Present
    [Documentation]    Open Standalone Weekly Payments
    [Tags]    KE    UG
    Confirm that user clicks on the open savings navigation and enters amount
    Check that Recurring journey is selectable
    Verify That User Selects the Weekly Frequency
    Confirm the recurring amount is keyed in
    Verify user successfully enters the start date
    Confirm that user enters Last payment date and completes the transaction successfully

