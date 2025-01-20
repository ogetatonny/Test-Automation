*** Settings ***
Documentation  Verify That User Can Successfully Login with a Valid Credential
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/LoginPage.robot


*** Test Cases ***
Validate EquityApp Home Page
    [Tags]    KE   RW   UG   TZ  SS
    Open Equity Mobile Application on device 1
    sleep   5s

Navigate to Login Screen
    [Tags]    KE   RW   UG   TZ  SS
    Navigate to Login Page

Login with valid credentials
	[Tags]    KE   RW   UG   TZ  SS
    User Login With Valid Credential

OTP verification on login
	[Tags]    KE   RW   UG   TZ  SS
	Key in OTP and Verify

Answer security questions
	[Tags]    KE   RW   UG   TZ  SS
	Select and Confirm an Option to Verify Security Question
	Answer First Security Question
	Answer Second Security Question
	Click on Confirm Security Question Button

Terminate all existing devices
	[Tags]    KE   RW   UG   TZ  SS
	Click on the Show Me Later Button
	Remove Existing Devices

#Open Equity Mobile Application on the second device
#    [Tags]    KE   RW   UG   TZ  SS
#    Open Equity Mobile Application On Device 2

#Validate HomePage
#	[Tags]    KE   RW   UG   TZ  SS
#    Click on the Show Me Later Button
#    Validate Page Title
#	Validate Customer Accounts are available

#Initial App Launch ad Nav to Homepage
#    Open Equity Mobile Application
#    sleep   5s
#    Navigate to Login Page
#    User Login With Valid Credential
#	Key in OTP and Verify
#	Select and Confirm an Option to Verify Security Question
#	Answer First Security Question
#	Answer Second Security Question
#	Click on Confirm Security Question Button
#	Click on the Show Me Later Button
#	Remove Existing Devices
#    Click on the Show Me Later Button
#    Validate Page Title
#	Validate Customer Accounts are available
