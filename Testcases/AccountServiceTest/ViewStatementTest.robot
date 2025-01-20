*** Settings ***
Documentation  Verify That User Can Successfully View and Share Account Statement
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/AccountStatementPage.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/HomePage.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Suite Setup   Initial App Launch and Nav to Homepage

*** Test Cases ***
User Navigate View Statement Screen
	[Documentation]    Navigate to Account Statement Page
	[Tags]    KE   RW   UG   TZ  SS
	Click On Savings Accounts
	Click on View Statement Link
	click 3_Months statement duration and view statement

#User View 3 Months Statement
	#[Documentation]    View 3 Months Statement
	#[Tags]    KE   RW   UG   TZ  SS
	#Click Statement Duration        3 Months
	#Click Statement Duration    ${STATEMENT_DURATIONS}  3 Months
	#Click on the View Button

#User view 3 Months Statement
    #click 3_Months statement duration and view statement

#Share 3 Months Account Statement
#	[Documentation]    Share 3 Months Account Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on the Share Menu
#	Share Statement
#
#User View 6 Months Statement
#	[Documentation]    View 6 Months Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Click Statement Duration        6 Months
#	Click on the View Button
#
#Send 6 Months Account Statement To Email
#	[Documentation]    Send 6 Month Account Statement to Email
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on the Share Menu
#	Send Statement to Email
#
#User View 12 Months Statement
#	[Documentation]    View 12 Months Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Click Statement Duration        12 Months
#	Click on the View Button
#
#Download 12 Months Account Statement
#	[Documentation]    Download 12 Months Account Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on the Share Menu
#	Download Statement to Phone
#
#User View 2 Years Statement
#	[Documentation]    View 2 Years Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Scroll Right The App
#	Click Statement Duration        2 Years
#	Click on the View Button
#
#Download 2 Years Account Statement
#	[Documentation]    Download 2 Years Account Statement
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on the Share Menu
#	Download Statement to Phone
#
#Navigate back to home screen
#	[Tags]    KE   RW   UG   TZ  SS
#	Navigate back to home screen