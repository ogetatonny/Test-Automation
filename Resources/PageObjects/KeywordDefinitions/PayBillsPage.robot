*** Settings ***
Library               AppiumLibrary       15      run_on_failure=Log Source
Library               Process
Library  Screenshot    default_directory=../Screenshots
Variables    ../Locators/PayBillScreen.py
Variables    ../Locators/BuyAirtimeScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot
Resource    ../KeywordDefinitions/SendMoney.robot

*** Keywords ***
Click on Pay Bill Menu
	Scroll Down the App
	Click Transaction Items     Pay a bill
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Pay bill

Select a Biller
	Wait Until Element Is Ready And Click     ${BUY_FOR_FIELD}
	Verify Screen Title                       ${SCREEN_TITLE_FIELD}       	Pay to

Click on Biller Details
	Wait Until Element Is Ready And Click     ${BILLER_DETAILS_BUTTON}
	Verify Screen Title                       ${SCREEN_TITLE_TEXT}    	Bill details

Enter Biller Number
	[Arguments]    ${BillerNumberCode}
	Wait Until Element Is Ready    ${BILLER_NUMBER_TEXTFIELD}
	Input Text    ${BILLER_NUMBER_TEXTFIELD}        ${BillerNumberCode}

Click on Continue Button After Biller Number
	Wait Until Element Is Ready And Click    ${CONTINUE_BUTTON_AFTER_BILL_NUMBER}
	Verify Screen Title                      ${SCREEN_TITLE_FIELD}		Bill details

Enter Account Or Meter Number
	[Arguments]    ${ACCOUNT_NUMBER}
    Wait Until Element Is Ready   ${ACCOUNT_NUMBER_TEXTFIELD}
    Input Text    ${ACCOUNT_NUMBER_TEXTFIELD}       ${ACCOUNT_NUMBER}

Click on the Next Button
	Wait Until Element Is Ready And Click    ${NEXT_BUTTON}
	Sleep    10 sec
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Pay bill

Select An Amount
	Wait Until Element Is Ready And Click    ${SELECT_AN_AMOUNT}
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Pay a bill

Select Full Amount
	Wait Until Element Is Ready And Click    ${SELECT_FULL_AMOUNT}

Select Another Amount
	Wait Until Element Is Ready And Click    ${SELECT_ANOTHER_AMOUNT}

Enter An Amount
	[Arguments]    ${AMOUNT}
	Wait Until Element Is Ready    ${AMOUNT_TEXTFIELD}
	Input Text    ${AMOUNT_TEXTFIELD}       ${AMOUNT}

Click on Continue After Amount
	Wait Until Element Is Ready And Click    ${CONTINUE_AFTER_AMOUNT}
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Pay bill

Click on Pay Bill Button
	Wait Until Element Is Ready And Click    ${PAY_BILL_BUTTON}
	Verify Payment Confirmation

Click on Continue Button After Confirmation
	Wait Until Element Is Ready And Click    ${CONTINUE_ON_CONFIRMATION_BUTTON}

Enter PayBill Amount
	[Arguments]    ${AMOUNT}
	Input Text    ${PAYBILL_AMOUNT_FIELD}     ${AMOUNT}


Pay A Bill For
    [Documentation]    Pay a bill
    [Arguments]    ${BillerNumberCode}   ${Account_Meter_Number}      ${PaymentReason}
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
    Select a Biller
    Click on Biller Details
    Enter Biller Number         ${BillerNumberCode}
    Click on Continue Button After Biller Number
    Enter Account Or Meter Number        ${Account_Meter_Number}
    Click on the Next Button
    Select An Amount
    Select Another Amount
    Enter An Amount      ${random_number}
    Click on Continue After Amount
    Enter Payment Reason        ${PaymentReason}
    Click on Pay Bill Button
    Charge Fee Verification     ${user_subsidiary["pay_bill_charge_fee"]}
    Click on Continue Button After Confirmation
    Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home


Pay Bill For KPLC Customer
	Pay A Bill For          ${user_subsidiary["PAY_BILL"]["KPLC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["KPLC_Account_Meter_Number"]}       Part payment for KPLC

Pay Bill For ZUKU Customer
	Pay A Bill For          ${user_subsidiary["PAY_BILL"]["ZUKU_BillCode"]}      ${user_subsidiary["PAY_BILL"]["ZUKU_Account_Meter_Number"]}      Part payment for Zuku

Pay Bill For WASAC Customer
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["WASAC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["WASAC_Number"]}       payment for WASAC

Pay Bill For MTN Customer
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["MTN_BillCode"]}      ${user_subsidiary["PAY_BILL"]["MTN_ESCROW_NUMBER"]}       payment for MTN

Pay Bill For UMENE Customer
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_BillCode"]}      ${user_subsidiary["PAY_BILL"]["UMENE_NEW_CONN_Meter_Number"]}       payment for UMENE

Pay Bill For LUKU Customer
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["LUKU_BillCode"]}      ${user_subsidiary["PAY_BILL"]["LUKU_Number"]}       payment for Luku

Pay Bill For TrinityTech Customer
	Pay Bill For          ${user_subsidiary["PAY_BILL"]["TrinityTech_BillCode"]}      ${user_subsidiary["PAY_BILL"]["TrinityTech_Number"]}       payment for Trinity Tech



Pay Bill For
    [Documentation]    Pay a bill
    [Arguments]    ${BillerNumberCode}   ${Account_Meter_Number}      ${PaymentReason}
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
    Select a Biller
    Click on Biller Details
    Enter Biller Number         ${BillerNumberCode}
    Click on Continue Button After Biller Number
    Enter Account Or Meter Number        ${Account_Meter_Number}
    Click on the Next Button
    Enter PayBill Amount      ${random_number}
    Enter Payment Reason        ${PaymentReason}
    Click on Pay Bill Button
    Charge Fee Verification     ${user_subsidiary["pay_bill_charge_fee"]}
    Click on Continue Button After Confirmation
    Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home



