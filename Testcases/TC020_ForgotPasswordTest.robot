*** Settings ***
Documentation  Verify That User Can Successfully Reset Password
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/LoginPage.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/ForgotPassword.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/LogoutPage.robot

*** Test Cases ***
User Logs Out of the App
	Logout From the App

Navigate to Forgot Password Screen
    Click on Forgot Yout Password Link

User Verification Via SMS
	Verification Via SMS

OTP verification on login
	Input Verification Code

Verification By Security Challenge
	Select Security Challenge as verification option

Answer security questions
	Input Security Answer For First Question           ${SECURITY-ANSWER1}[answer]
	Input Security Answer For Second Question          ${SECURITY-ANSWER2}[answer]
	Click on Confirm Security Question Button

Create a Strong Password
	Enter New Password          ${NEW_PASSWORD}
	Re-Enter The Password       ${CONFIRM_NEW_PASSWORD}
	Confirm Password Changes

Validate HomePage
	Validate Page Title           Home
	Validate Customer Accounts are available