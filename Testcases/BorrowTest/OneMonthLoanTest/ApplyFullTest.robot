*** Settings ***
Documentation    testing loan request and payment
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../../Resources/PageObjects/KeywordDefinitions/OneMonthLoan.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***

Apply for one month loan - full loan application
    [Tags]    KE
    Apply for the full amount
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed