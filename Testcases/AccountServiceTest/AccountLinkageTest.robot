*** Settings ***
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Documentation       Test Suite containing Linking and Delink from customer profile
Resource        ../../Resources/PageObjects/KeywordDefinitions/AccountLinkage.robot

*** Test Cases ***
User delinks their account
	[Tags]    KE   RW   UG   TZ  SS
    Get The Customer's Account Number
    Remove The Customer's Account Number

User adds back their account
	[Tags]    KE   RW   UG   TZ  SS
    Navigate to existing accounts
    Add select account and add to profile

User verify account added successfully
	[Tags]    KE   RW   UG   TZ   SS
    Verify that Account is Successfully Added