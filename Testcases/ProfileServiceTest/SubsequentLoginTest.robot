*** Settings ***
Documentation  Verify That User Can Successfully Login with a Valid Credential
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/LoginPage.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/LogoutPage.robot

*** Test Cases ***
Subsequent Login
	[Tags]    KE   RW   UG   TZ  SS
    Logout From the App
	Subsequent Login with Valid Password
	Validate Page Title
	Validate Customer Accounts are available
