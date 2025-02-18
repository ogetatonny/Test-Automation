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


Open fixed deposit when other save products are opened
    [Tags]    KE  UG  RW  TZ
    [Documentation]    Reinvesting - A/C closed
    Confirm User Opens fixed deposit - Reinvest journey
    validate the fixed deposit A/C info
    Confirm the interest rates document is attached
    confirm user closes the fixed deposit account


