*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot



*** Test Cases ***

Open Goal Savings - No other Save Product Present
    [Tags]    KE    UG    TZ    SS
    Open goal account when there are no other save accounts

Open Goal Savings - Other Save Products Present
    [Tags]    KE    UG    TZ    SS
    Open Goal account when there are other save accounts
    Convert the goal manual top up to recurring payments
    Goal Recurring transfer Journey    Exams    8000    40000

