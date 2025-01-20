*** Settings ***
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Documentation       Test Suite containing Linking and Delink from customer profile
Resource        ../../Resources/PageObjects/KeywordDefinitions/AccountLinkage.robot
Resource    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
#User delinks their account
#	[Tags]    KE   RW   UG   TZ  SS
#    Get The Customer's Account Number
#    Remove The Customer's Account Number
#
#User adds back their account
#	[Tags]    KE   RW   UG   TZ  SS
#    Navigate to existing accounts
#    Add select account and add to profile
#
#User verify account added successfully
#	[Tags]    KE   RW   UG   TZ   SS
#    Verify that Account is Successfully Added

No unlinking, unlinking and checking if the remove popup icon is working
    [Tags]    KE    RW    UG    TZ    SS
    click on the three dots on the account card (no unlinking)
    checking that the remove pop up button is working
    click on the three dots on the account card (unlinking)