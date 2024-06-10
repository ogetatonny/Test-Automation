*** Settings ***
Documentation  Verify That User can successfully Withdraw from an Agent
Library   AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/PayBillsPage.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown



*** Test Cases ***
Bill Payment for UMENE Customer
	[Tags]    UG
	[Documentation]    Bill Payment for UMENE
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_BillCode"]}      ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_Meter_Number"]}       payment for UMENE
