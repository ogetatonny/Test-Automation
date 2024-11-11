*** Settings ***
Documentation  Verify That User can successfully View All Balances
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/HomePage.robot
Resource    ../../Resources/PageObjects/KeywordDefinitions/AccountStatementPage.robot

*** Test Cases ***
User Verify My Balance
	[Tags]    KE   RW   UG   TZ  SS
	View Show Balance

User Navigate to Balance Information
	[Tags]    KE   RW   UG   TZ  SS
	Click On Savings Accounts
	Navigate to Balance Information

User should view total balance
	[Tags]    KE   RW   UG   TZ  SS
	User should view total balance

User should view Lien/blocked balance
	[Tags]    KE   RW   UG   TZ  SS
	User should view Lien/blocked balance

User should view uncleared balance
	[Tags]    KE   RW   UG   TZ  SS
	User should view uncleared balance

User should view available balance
	[Tags]    KE   RW   UG   TZ  SS
	User should view available balance

Validate the Available Balance
	[Tags]    KE   RW   UG   TZ  SS
	Verify The Sum of All Balances Equal the Available Balance
	Close The Modal
	Move Back to the Previous Screen
	Move Back to the Previous Screen

User should view the loan amount
	[Tags]    KE   RW   UG   TZ  SS
	Click on Borrow Menu
#	Verify that Loan Amount is displayed
	#Verify that Loan Balance is Displayed

User should view the installment amount
	[Tags]    KE   RW   UG   TZ  SS
	Verify that Loan has Installment Payment


