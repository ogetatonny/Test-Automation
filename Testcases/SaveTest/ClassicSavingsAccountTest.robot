*** Settings ***
Documentation       Save tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource   ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
Classic Savings Account 1
    [Tags]    KE   UG
    open classic savings account
    sleep  10s

Classic Savings Account 2
    [Tags]    KE   UG
    open classic savings account