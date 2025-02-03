*** Settings ***
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../../Resources/PageObjects/KeywordDefinitions/OneMonthLoan.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
Apply for one month loan - partial loan application
    [Tags]    KE
    check if unqualified user gets the right error message
    Apply Partially For Qualified User
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed
    Top up with the Remaining Loan Amount
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed