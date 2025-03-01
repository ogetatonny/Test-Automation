*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource   ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
#Open Classic Savings Account - No other Save A/C Present
#    [Documentation]    Manual Top Up
#    [Tags]    KE    UG
#    Verify classic savings opens successfully

Open Classic savings - Other Save A/Cs Present
    [Documentation]    Edit Manual Top Up
    [Tags]    KE    UG
#    Confirm user clicks classic open button, enters amount, submit
#    confirm classic terms and conditions are attached
#    verify the classic account opening completes successfully
    Confirm the manual top up can be modified to recurring payment

#Open classic - Other Save A/Cs present
#    [Documentation]    Daily Recurring Payments
#    [Tags]    KE    UG
#    Confirm that user clicks on the open savings navigation and enters amount
#    Check that Recurring journey is selectable
#    Verify That User Selects The Daily Frequency
#    Confirm the recurring amount is keyed in
#    Verify thet the starting date is tomorrow's date
#    Confirm that user enters Last payment date and completes the transaction successfully
#
#Open Classic Account - Other Save A/Cs Present
#    [Documentation]    Weekly Recurring Payments
#    [Tags]    KE    UG
#    Confirm that user clicks on the open savings navigation and enters amount
#    Check that Recurring journey is selectable
#    Verify That User Selects the Weekly Frequency
#    Confirm the recurring amount is keyed in
#    Verify thet the starting date is tomorrow's date
#    Confirm that user enters Last payment date and completes the transaction successfully

