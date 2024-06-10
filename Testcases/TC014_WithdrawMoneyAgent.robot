*** Settings ***
Documentation  Verify That User can successfully Withdraw from an Agent
Library   AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/WithdrawCashPage.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown

*** Test Cases ***
Customer Withdraw from An Agent Successfully
	[Documentation]    Customer Withdraw from An Agent Successfully
	[Tags]    KE   RW   UG   TZ  SS
	Click on Transact Menu
	Click On Agent Menu
	Withdraw Cash From An Agent         ${user_subsidiary["AGENT_NUMBER"]}