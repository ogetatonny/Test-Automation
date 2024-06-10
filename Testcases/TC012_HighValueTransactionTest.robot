*** Settings ***
Documentation  Verify That User can successfully Process High Value Transaction
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/SendMoney.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown


*** Test Cases ***
High Value Transaction For Another Equity Account
	[Documentation]    Processing High Value Transaction For Another Equity Account
	[Tags]    KE   RW   UG   TZ  SS
	Click on Transact Menu
	Click Send Money to Another Equity account Menu
	High Value Transaction to Another Equity Account
