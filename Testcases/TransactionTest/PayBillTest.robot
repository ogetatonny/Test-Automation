*** Settings ***
Documentation  Verify That User can successfully Pay Bills
Library   AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/PayBillsPage.robot

*** Test Cases ***
Bill Payment for KPLC Customer
	[Tags]    KE
	[Documentation]    Bill Payment for KPLC
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay A Bill For          ${user_subsidiary["PAY_BILL"]["KPLC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["KPLC_Account_Meter_Number"]}       Part payment for KPLC

Bill Payment for ZUKU Customer
	[Documentation]    Bill Payment for ZUKU
	[Tags]    KE
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay A Bill For          ${user_subsidiary["PAY_BILL"]["ZUKU_BillCode"]}      ${user_subsidiary["PAY_BILL"]["ZUKU_Account_Meter_Number"]}      Part payment for Zuku

Bill Payment for WASAC Customer
	[Tags]    RW
	[Documentation]    Bill Payment for WASAC
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["WASAC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["WASAC_Number"]}       payment for WASAC

Bill Payment for MTN Customer
	[Tags]    UG
	[Documentation]    Bill Payment for MTN
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["MTN_BillCode"]}      ${user_subsidiary["PAY_BILL"]["MTN_ESCROW_NUMBER"]}       payment for MTN

Bill Payment for UMENE Customer
	[Tags]    UG
	[Documentation]    Bill Payment for UMENE
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_BillCode"]}      ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_Meter_Number"]}       payment for UMENE

Bill Payment for LUKU Customer
	[Tags]      TZ
	[Documentation]    Bill Payment for LUKU
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["LUKU_BillCode"]}      ${user_subsidiary["PAY_BILL"]["LUKU_Number"]}       payment for Luku

Bill Payment for Customer
	[Tags]    SS
	[Documentation]    Bill Payment for
	Click on Transact Menu
	Click on Pay Bill Menu
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["TrinityTech_BillCode"]}      ${user_subsidiary["PAY_BILL"]["TrinityTech_Number"]}       payment for Trinity Tech
