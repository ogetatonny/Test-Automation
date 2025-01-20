*** Settings ***
Documentation    testing loan request and payment
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/OneMonthLoan.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
Apply for one month loan - partial loan application
    [Tags]    UG  KE  SS  TZ  RW
    check if unqualified user gets the right error message
    Apply Partially For Qualified User
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed
    Top up with the Remaining Loan Amount
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed

#Pay The One Month Loan - Partial Payment
#    [Tags]    UG  KE  SS  TZ  RW
#    Pay the one month loan partially
#    Pay the remaining one month loan amount
#
#Apply for one month loan - full loan application
#    [Tags]    UG  KE  SS  TZ  RW
#    Apply for the full amount
#    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed
#
#Pay one month loan - full payment
#    [Tags]    UG  KE  SS  TZ  RW
#    Pay all the one month loan amount that is on the user profile


