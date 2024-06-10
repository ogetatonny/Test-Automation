*** Settings ***
Documentation  Verify That User can successfully Schedule Payment
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/SchedulePaymentPage.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/BuyAirtimePage.robot
Resource    ../Resources/PageObjects/KeywordDefinitions/PayBillsPage.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown

*** Test Cases ***
Navigate to Manage Schedule Payment
	[Tags]    KE   RW   UG   TZ  SS
	Click on Transact Menu
#	Click on Manage Schedule Payment
#
#Schedule Payment Standalone for Another Equity
#	[Tags]    KE   RW   UG   TZ  SS
#	Schedule Payment For - An Equity Account       ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[0]
#
#Schedule Payment Standalone for Another Bank
#	[Tags]    KE   RW   UG   TZ  SS
#	Schedule Payment For - Another Bank            ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
#
#Schedule Payment Standalone for Pay a bill
#	[Tags]    KE
#	Schedule Payment For - Pay a bill              ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[3]
#
#Schedule Payment Standalone for Buy Airtime
#	[Tags]    KE   RW   UG   TZ
#	Schedule Payment For - Buy Airtime             ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[4]
#
#Schedule Payment Standalone for Pesalink Mobile
#	[Tags]    KE
#	Schedule Payment For - Pesalink Mobile         ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
#
#Schedule Payment Standalone for Mobile Money
#	[Tags]    KE   RW   UG   TZ
#	Schedule Payment For - Mobile Money            ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[2]
#	Navigate back to Transaction Screen

#Schedule Payment Buy Airtime for Airtel Customer after completing transaction
#	[Documentation]    Schedule Payment-Airtel Airtime Purchase
#	[Tags]    KE   RW  UG  TZ
#    Click on Buy Airtime
#    Schedule Payment To Buy Airtime For     ${user_subsidiary["TELCO"]["Airtel"]}     ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}
#
#Schedule Payment Bill Payment for KPLC Customer after completing transaction
#	[Documentation]    Schedule Payment-Bill Payment for KPLC
#	[Tags]    KE
#	Click on Pay Bill Menu
#	Schedule Payment To Pay Bill For      ${user_subsidiary["PAY_BILL"]["KPLC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["KPLC_Account_Meter_Number"]}     Part payment for KPLC
#
#User should be able to cancel a Scheduled Payment
#	[Documentation]     Cancel a Scheduled Payment
#	[Tags]    KE   RW   UG   TZ  SS
#	Cancel Schedule Payment For         Airtime
#
#User should be able to Filter Upcoming Scheduled Payment
#	[Documentation]     Filter Upcoming Scheduled Payment
#	[Tags]    KE   RW   UG   TZ  SS
#	Schedule Payment Filtering For      Airtime
#	Navigate back to Transaction Screen

Schedule Payment for Another Equity after completing transaction
   [Documentation]    Schedule Payment-Another Equity
   [Tags]    KE   RW   UG   TZ  SS
	Click Send Money to Another Equity account Menu
	Schedule Payment For Send Money To Another Equity Account
#	Verify Schedule Payment Status is      Successful

Schedule payment for Send Money to Another Bank Account after completing transaction
	[Documentation]    Schedule Payment-Send Money to Another Bank
	[Tags]    KE   RW   UG   TZ  SS
	Click on Transact Menu
	Click Send Money to Another Bank Menu
	Schedule Payment For Send Money To Another Bank
#	Verify Schedule Payment Status is       Successful

Schedule Payment for Send Money To Airtel Money after completing transaction
	[Documentation]    Schedule Payment-Send Money To Airtel Money
	[Tags]    KE   RW   UG   TZ
	Click on Transact Menu
    Click Send Money to Mobile money
    Schedule Payment For Send Money To Mobile Money     ${user_subsidiary["MOBILE_MONEY_TELCOS"]["AirtelMoney"]}       ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}
#    Verify Schedule Payment Status is

