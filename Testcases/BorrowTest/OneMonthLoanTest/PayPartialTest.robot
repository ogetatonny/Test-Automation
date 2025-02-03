*** Settings ***
Documentation    testing loan request and payment
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../../Resources/PageObjects/KeywordDefinitions/OneMonthLoan.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***

Pay The One Month Loan - Partial Payment
    [Tags]    KE
    Pay the one month loan partially
    Pay the remaining one month loan amount