*** Settings ***
Documentation    testing loan request and payment
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../../Resources/PageObjects/KeywordDefinitions/OneMonthLoan.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***

Pay one month loan - full payment
    [Tags]     KE
    Pay all the one month loan amount that is on the user profile