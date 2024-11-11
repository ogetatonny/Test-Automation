*** Settings ***
Library    AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/LoginPage.robot

*** Keywords ***
User Login with Invalid Credential
	   Open Equity Mobile Application
	   Navigate to Login Page
       Input Email address/Mobile Number
       Input Invalid User Password
       Click on Login Button
       Check To See If The Error Message Is Visible

*** Test Cases ***
Login using Invalid Credentials
    [Documentation]    Login with Invalid Password Should Returns Error Message
	[Tags]    KE   RW   UG   TZ  SS
	User Login With Invalid Credential