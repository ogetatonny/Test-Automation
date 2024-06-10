*** Settings ***
Library               AppiumLibrary       15      run_on_failure=Log Source
Library               Process
Library  Screenshot    default_directory=../Screenshots
Variables    ../Locators/BuyAirtimeScreen.py
Variables    ../Locators/TransactMenuScreen.py
Variables    ../Locators/ManageSchedulePaymentScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot
Resource    ../KeywordDefinitions/SendMoney.robot

*** Keywords ***
Click on Buy Airtime
	Scroll Down the App
	Click Transaction Items     Buy airtime
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Buy airtime

Buy for Someone New
	Wait Until Element Is Ready And Click        ${BUY_FOR_FIELD}
	Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Buy for
	Wait Until Element Is Ready And Click        ${SEND_TO_SOMEONE_NEW_BUTTON}

Select a Mobile Telco
	[Arguments]    ${TElCO}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Buy for someone new
	Select a Telco          ${TElCO}

Click on Buy Airtime Button
	Wait Until Element Is Ready And Click        ${BUY_AIRTIME_BTN}

Confirm Airtime Purchase
	Wait Until Element Is Ready And Click    ${CONFIRM_AIRTIME_BUTTON}

Enter Customer Mobile Number
    [Arguments]    ${MOBILE_NUMBER}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Buy for someone new
	Input Text    ${MOBILE_NUMBER_VALUE_FIELD}         ${MOBILE_NUMBER}

Verify Buy Airtime transaction is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}          Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}      Great!
	Verify Screen Title    ${DOWNLOAD_RECEIPT_BUTTON}        Download receipt
	Verify Screen Title    ${SUCCESS_MESSAGE_TEXT_FIELD}     Your airtime was purchased successfully

Buy Airtime For
	[Documentation]    Buy Airtime from Telco
    [Arguments]    ${TELCO}    ${PHONENUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["moderate_minimum"]}, ${user_subsidiary["moderate_maximum"]})
    Buy for Someone New
    Select a Mobile Telco     ${TELCO}
    Enter Customer Mobile Number             ${PHONENUMBER}
    Click Continue to Add Beneficiary
    Enter Amount          ${random_number}
	Enter Payment Reason      Buy Airtime for ${TELCO}
	Click on Buy Airtime Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["airtime_charge_fee"]}
	Confirm Airtime Purchase
    Transaction Verification
    Verify Buy Airtime transaction is Successful


Purchasing of Airtime
  Navigate to Transact
  Select Buy Airtime
  Verify Service Transaction Page Loaded
  Verify Service Transaction Page Contents
  Select Source Account
  Select The Recipient Then Select Buy To Someone New
  Select The Recipient Telco Country
  Choose The Buy Airtime Recipient Operator
  Enter Airtime Recipient Phone Number
  Click 'ADD' To Proceed
  Enter Airtime Amount and Send to recipient



Buy Airtime For InterCountry
	[Documentation]    Buy Airtime from Telco
    [Arguments]    ${DESTINATION_COUNTRY}  ${TELCO}    ${PHONENUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["usdMinimum"]}, ${user_subsidiary["usdMaximum"]})
    Buy for Someone New
    Pick a Country from Dropdown
	Search and Select a Country       ${DESTINATION_COUNTRY}
    Select a Mobile Telco     ${TELCO}
    Enter Customer Mobile Number             ${PHONENUMBER}
    Click Continue to Add Beneficiary
    Enter Amount          ${random_number}
	Enter Payment Reason      Buy Airtime for ${TELCO}
	Click on Buy Airtime Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["airtime_charge_fee"]}
	Verify Screen Title    	${CONVERSION_RATE_LABEL}        Exchange rate
	Confirm Airtime Purchase
    Transaction Verification
    Verify Buy Airtime transaction is Successful
