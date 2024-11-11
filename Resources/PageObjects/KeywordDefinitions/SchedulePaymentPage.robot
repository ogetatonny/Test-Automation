*** Settings ***
Library               AppiumLibrary       15      run_on_failure=Log Source
Library               Process
Library  Screenshot    default_directory=../Screenshots
Variables    ../Locators/PayBillScreen.py
Variables    ../Locators/TransactMenuScreen.py
Variables    ../Locators/ManageSchedulePaymentScreen.py
Resource    ../KeywordDefinitions/PayBillsPage.robot
Resource    ../KeywordDefinitions/BuyAirtimePage.robot


*** Keywords ***
Click on Manage Schedule Payment
	Wait Until Element Is Ready             ${SCHEDULE_PAYMENT_LABEL}
	${Field_Text}=  Get Text                ${SCHEDULE_PAYMENT_LABEL}
	Should Contain                          ${Field_Text}                     Schedule Payments
	Wait Until Element Is Ready And Click   ${MANAGE_SCHEDULE_PAYMENT_BUTTON}
	Verify Screen Title         ${SCREEN_TITLE_TEXT}        Scheduled payments

Filter Schedule Payment For
	[Arguments]    ${Filter_Transaction_Type}
	Click Schedule Payment Filter Transaction     ${Filter_Transaction_Type}

Click on Schedule New Payment
	Wait Until Element Is Ready And Click    ${SCHEDULE_A_NEW_PAYMENT_BUTTON}
	Verify Screen Title         ${SCREEN_TITLE_TEXT}        Schedule a Payment

Select Transaction Type
	[Arguments]    ${Transaction_Type}
    Wait Until Element Is Ready And Click    ${SCHEDULE_A_NEW_PAYMENT_TRANSACTION_TYPE_FIELD}
    Verify Screen Title         ${SCREEN_TITLE_TEXT}        Transaction type
    Click Schedule Payment Transaction Type        ${Transaction_Type}
    Sleep   5sec
    Wait Until Element Is Ready And Click    ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}
    #Verify Screen Title     ${SCREEN_TITLE_FIELD}      ${Transaction_Type}

Click Set Up Payment and Reminder
	Wait Until Element Is Ready And Click     ${SET_UP_A_PAYMENT_REMINDER_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Schedule a Payment

Click Button to Setup Frequency
	Wait Until Element Is Ready And Click    ${BTN_SET_UP_FREQUENCY}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Schedule a Payment

Select Frequency
	[Arguments]    ${TRANSACTION_FREQUENCY}
	Wait Until Element Is Ready And Click    ${SELECT_FREQUENCY_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      	Frequency
	Select Transaction Frequency        ${TRANSACTION_FREQUENCY}

Select First Payment Date
	Wait Until Element Is Ready And Click    ${SELECT_FIRST_PAYMENT_DATE_FIELD}

Select Month
	Wait Until Element Is Ready And Click    ${NEXT_MONTH_ARROW_BUTTON}

Select a Day of the Month
    [Documentation]    click the day
    Verify Screen Title    ${DATE_PICKER_TITLE_LABEL}       SELECT A DATE
    [Arguments]      ${DAY_OF_THE_MONTH}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${DAY_OF_THE_MONTH}']

Click OK Button
	Wait Until Element Is Ready And Click    ${CONFIRM_OK_BUTTON}

Click OKay _Receipient_Hidden
	Wait Until Element Is Ready And Click    ${CONFIRM_OKAY_BUTTON}

Select End Payment Date
	Wait Until Element Is Ready And Click    ${SELECT_LAST_PAYMENT_DATE_FIELD}

Reminder frequency and Click Continue
	[Arguments]    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${SET_A_REMINDER_VALUE_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Remind me
	Select Reminder    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}
	Select Debit Account
	Sleep    30 sec
	Wait Until Keyword Succeeds    1min     1sec       Click Element        ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}


Reminder frequency
	[Arguments]    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${SET_A_REMINDER_VALUE_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Remind me
	Select Reminder    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}
	Select Debit Account
	Sleep    20 sec

Click on Currency Field
	Wait Until Element Is Ready And Click    ${SElECT_CURRENCY}

Click Continue Now
	Wait Until Element Is Ready And Click      ${CONTD_SEND_FR_CONFIRMATION_BUTTON}

    #${passed}  Run Keyword And Return Status     Element Should Be Enabled    	//androidx.cardview.widget.CardView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/container"]/android.widget.LinearLayout/android.widget.Button[@text='Continue']
    #Run Keyword If    ${passed}   Wait Until Element Is Ready And Click      	//androidx.cardview.widget.CardView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/container"]/android.widget.LinearLayout/android.widget.Button[@text='Continue']

#	Wait Until Keyword Succeeds    60x     500ms       Click Element        ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}
	#//androidx.cardview.widget.CardView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/container"]/android.widget.LinearLayout/android.widget.Button[@text='Continue']


Remind Me About My Payment
	[Arguments]    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${SET_A_REMINDER_VALUE_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Remind me
	Select Reminder    ${REMINDER_ME}
	Wait Until Element Is Ready And Click    ${CONTD_SEND_FOR_CONFIRMATION_BUTTON}

Click on Continue
	Wait Until Element Is Ready And Click    ${BTN_CONTINUE}

Payment Confirmantion and Send
	Verify Screen Title     ${SCREEN_TITLE_TEXT}     Payment confirmation
	Wait Until Element Is Ready And Click        ${CONTINUE_PAY_BUTTON}

Click on Send Money Button on Payment Confirmation
	Verify Screen Title     ${SCREEN_TITLE_TEXT}     Payment confirmation
	Wait Until Element Is Ready And Click        ${SEND_MONEY_CONFIRMATION}

Click on Confirm Button on Payment Confirmation
	Verify Screen Title     ${SCREEN_TITLE_TEXT}     Payment confirmation
	Wait Until Element Is Ready And Click        ${CONFIRM_CONFIRMATION_BUTTON}

Verify that Schedule Payment is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     You’re all set!
	Verify Screen Title    ${SUCCESS_MESSAGE_TEXT_FIELD}       Your payment has been scheduled to occur
	Wait Until Element Is Ready And Click    ${DONE_BUTTON}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}    Scheduled payments

Navigate back to Transaction Screen
	Sleep    3sec
	Wait Until Element Is Ready And Click    ${CLOSE_SCHEDULE_TRANSACTION_TYPE_MODAL}

Verify Schedule Payment is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!

Done Done
		Wait Until Element Is Ready And Click    ${DONE_BTN}

Verify Schedule Payment Status is
	[Arguments]       ${SUCCESS_MESSAGE}
	Verify Screen Title    ${SUCCESS_MESSAGE_TEXT_FIELD}       ${SUCCESS_MESSAGE}
	Wait Until Element Is Ready And Click    ${DONE_BTN}

Clear and Re-enter Amount
	[Arguments]    ${TRANSFER_AMOUNT}
	Clear Text     ${TEXTFIELD_AMOUNT}
	Input Text     ${TEXTFIELD_AMOUNT}          ${TRANSFER_AMOUNT}

Select Debit Account
    Wait Until Element Is Ready And Click        ${SEND_FROM_FIELD}
    Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Pay from
    Wait Until Element Is Ready And Click        ${SELECT_DEBIT_ACCOUNT}

Verify that Transaction is Completed and Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!
	Verify Screen Title    ${DOWNLOAD_RECEIPT_BUTTON}       Download receipt
	Verify Screen Title    ${SCHEDULE_PAYMENT_BUTTON}       Schedule payment

Schedule Payment Confirmation After a Success Transation
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!
	Wait Until Element Is Ready And Click    ${DONE_BUTTON}

Click on the Schdule Payment
	Wait Until Element Is Ready And Click    ${SCHEDULE_PAYMENT_BUTTON}

Navigate to Cancel Modal
	Wait Until Element Is Ready And Click    ${BTN_MORE_CANCEL}

Set Frequency For Schedule Payment
	Select Frequency        ${TRANSACTION_FREQUENCY}[3]
    Select First Payment Date
    Select Month
    Select a Day of the Month       1
    Click OK Button
    Select End Payment Date
    Select Month
    Select a Day of the Month       30
    Click OK Button



Schedule Payment For - An Equity Account
    [Documentation]    Schedule Payment For An Equity Account

	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMinimum"]}, ${user_subsidiary["schedulePaymentMaximum"]})
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[0]
	Click Send To Someone New
	Enter Account Number       ${user_subsidiary["intra_destination_account"]}
	Click on Continue to Add Beneficiary
    Enter Amount                ${random_number}
	Enter Payment Reason        Schedule Payment for  ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[0]
	Click Set Up Payment and Reminder
    Set Frequency For Schedule Payment
    Reminder frequency and Click Continue       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_intra_destination_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful

Schedule Payment For - Another Bank
	[Documentation]    Schedule Payment For Another Bank
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMinimum"]}, ${user_subsidiary["schedulePaymentMaximum"]})
	${random_name}  Generate Random String   12   [LOWER]
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
	Click Send To Someone New
	Search and Select a Bank        ${user_subsidiary["RTGS_destination_name"]}
	Enter Bank Account Number       ${user_subsidiary["RTGS_destination_account"]}
	Click Continue to Add Beneficiary
	Enter Full Name                 ${random_name} DOE
	Click Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason       Schedule Payment for   ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
	Click Set Up Payment and Reminder
    Set Frequency For Schedule Payment
    Reminder frequency and Click Continue       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful

Schedule Payment For - Pesalink Mobile
	[Documentation]    Schedule Payment For Pesalink Mobile
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMinimum"]}, ${user_subsidiary["schedulePaymentMaximum"]})
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
	Click on Send Money to Phone-Linked Account
    Enter Mobile Number        ${user_subsidiary["PESALINK_NUMBER"]}
    Click Continue to Add Beneficiary
    Select Recipient's Bank
    Enter Amount          ${random_number}
	Enter Payment Reason       Schedule Payment for   ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[1]
    Click Set Up Payment and Reminder
    Set Frequency For Schedule Payment
    Reminder frequency and Click Continue       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful

Schedule Payment For - Mobile Money
	[Documentation]    Schedule Payment For Mobile Money
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMobileMoneyMin"]}, ${user_subsidiary["schedulePaymentMobileMoneyMin"]})
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[2]
	Click Send To Someone New
    Select a Mobile Money Telco     ${user_subsidiary["MOBILE_MONEY_TELCOS"]["AirtelMoney"]}
    Enter Mobile Number             ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}
    Click on Continue to Add Beneficiary
    Enter Amount          ${random_number}
    Sleep    10sec
	Enter Payment Reason       Schedule Payment for   ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[2]
    Click Set Up Payment and Reminder
    Set Frequency For Schedule Payment
#    Reminder frequency      ${REMIND_ME}[1]
#    Enter Amount          ${random_number}
#    Click Continue Now
#    Clear Amount
###  Click Amount Field
##   Click on Currency Field
    Reminder frequency and Click Continue       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePaymentMM_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful

Schedule Payment For - Pay a bill
	[Documentation]    Schedule Payment For Pay a bill
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMin"]}, ${user_subsidiary["schedulePaymentMin"]})
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[3]
	Select a Biller
    Click on Biller Details
    Enter Biller Number         ${user_subsidiary["PAY_BILL"]["KPLC_BillCode"]}
    Click on Continue Button After Biller Number
    Enter Account Or Meter Number        ${user_subsidiary["PAY_BILL"]["KPLC_Account_Meter_Number"]}
    Click on the Next Button
    Enter Amount         ${random_number}
    Enter Payment Reason        SP for  ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[3] as Part payment for KPLC
    Click Button to Setup Frequency
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Click on Pay Bill Button
    Charge Fee Verification     ${user_subsidiary["schedulePayment_payBill_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful

Schedule Payment For - Buy Airtime
	[Documentation]    Schedule Payment For Buy Airtime
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMin"]}, ${user_subsidiary["schedulePaymentMin"]})
	Click on Schedule New Payment
	Select Transaction Type     ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[4]
	Buy for Someone New
    Select a Mobile Telco     ${user_subsidiary["TELCO"]["Airtel"]}
    Enter Customer Mobile Number             ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}
    Click Continue to Add Beneficiary
    Enter Amount          ${random_number}
	Enter Payment Reason      Schedule Payment for   ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}[4]
	Click Set Up Payment and Reminder
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Click on Buy Airtime Button
    Charge Fee Verification     ${user_subsidiary["schedulePayment_No_charge_fee"]}
    Payment Confirmantion and Send
    Transaction Verification
    Verify that Schedule Payment is Successful


Schedule Payment For Send Money To Another Equity Account
    [Documentation]    User Schedule Payment After Transaction
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMinimum"]}, ${user_subsidiary["schedulePaymentMaximum"]})
	Click Send To Someone New
	Enter Account Number        ${user_subsidiary["intra_destination_account"]}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason      Schedule Payment for Another Equity Account
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["schedulePayment_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that Transaction is Completed and Successful
	Click on the Schdule Payment
    Select Frequency        ${TRANSACTION_FREQUENCY}[3]
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_charge_fee"]}
    Click on Send Money Button on Payment Confirmation
    Verify Schedule Payment is Successful
    Click On Done Button

Schedule Payment For Send Money To Another Bank
    [Documentation]    Schedule Payment For Send Money To Another Bank
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMinimum"]}, ${user_subsidiary["schedulePaymentMaximum"]})
	${random_name}  Generate Random String   8   [LOWER]
	Click Send To Someone New
	Search and Select a Bank        ${user_subsidiary["RTGS_destination_name"]}
	Enter Bank Account Number       ${user_subsidiary["RTGS_destination_account"]}
	Click Continue to Add Beneficiary
	Enter Full Name                 ${random_name} DOE
	Click Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason       Schedule Payment For SM To Another Bank
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["RTGS_charge_fee"]}
	Confirm and Send
    Transaction Verification
	Verify that Transaction is Completed and Successful
	Click on the Schdule Payment
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    #Charge Fee Verification     2.26 KES
    Click on Send Money Button on Payment Confirmation
    Verify Schedule Payment is Successful
    Click On Done Button


Schedule Payment For Send Money To Mobile Money
	[Documentation]    Send money to mobile money
    [Arguments]    ${MOBILEMONEY_TELCOS}    ${PHONE_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["schedulePaymentMin"]}, ${user_subsidiary["schedulePaymentMax"]})
    Click Send To Someone New
    Select a Mobile Money Telco     ${MOBILEMONEY_TELCOS}
    Enter Mobile Number             ${PHONE_NUMBER}
    Click Continue to Add Beneficiary
    Enter Amount          ${random_number}
	Enter Payment Reason       Sending Money to Mobile Money
	Click on Send Money Button
	Verify Payment Confirmation
	Confirm and Send
    Transaction Verification
    Verify that Transaction is Completed and Successful
    Click on the Schdule Payment
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Click on Send Money Button on Payment Confirmation
    Verify Schedule Payment is Successful
    Done Done
    #Verify Screen Title    ${MAIN_TITLE}    Transact

Schedule Payment For Send Money To Airtel Mobile Money
    Schedule Payment For Send Money To Mobile Money     ${user_subsidiary["MOBILE_MONEY_TELCOS"]["AirtelMoney"]}       ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}


Schedule Payment To Buy Airtime For
	[Documentation]    Buy Airtime from Telco
    [Arguments]    ${TELCO}    ${PHONE_NUMBER}
    Buy Airtime For     ${TELCO}    ${PHONE_NUMBER}
    Verify that Transaction is Completed and Successful
   	Click on the Schdule Payment
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_No_charge_fee"]}
    Click on Confirm Button on Payment Confirmation
    Verify Schedule Payment is Successful
    Verify Schedule Payment Status is       Successful
    Verify Screen Title    ${MAIN_TITLE}    Transact

Schedule Payment To Buy Airtime For Airtel
    Schedule Payment To Buy Airtime For     ${user_subsidiary["TELCO"]["Airtel"]}     ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}


Schedule Payment To Pay Bill For
    [Documentation]    Schedule Payment To Pay Bill
    [Arguments]    ${BillerNumberCode}   ${Account_Meter_Number}      ${PaymentReason}
    Pay A Bill For      ${BillerNumberCode}   ${Account_Meter_Number}      ${PaymentReason}
	Verify that Transaction is Completed and Successful
	Click on the Schdule Payment
    Set Frequency For Schedule Payment
    Remind Me About My Payment       ${REMIND_ME}[1]
    Charge Fee Verification     ${user_subsidiary["schedulePayment_No_charge_fee"]}
    Click on Confirm Button on Payment Confirmation
    Verify Schedule Payment is Successful
    Verify Schedule Payment Status is     Your bill was paid successfully
    #Verify Screen Title    ${MAIN_TITLE}    Transact

Schedule Payment To Pay Bill For KPLC
	Schedule Payment To Pay Bill For      ${user_subsidiary["PAY_BILL"]["KPLC_BillCode"]}      ${user_subsidiary["PAY_BILL"]["KPLC_Account_Meter_Number"]}     Part payment for KPLC

Cancel Schedule Payment For
	[Arguments]    ${TRANS_TYPE}
	Click on Manage Schedule Payment
	Scroll Right the App
	Click Schedule Payment Filter Transaction       ${TRANS_TYPE}
	Navigate to Cancel Modal
	Verify Screen Title    ${HEADER_CARD_FIELD}     Manage this payment
	Wait Until Element Is Ready And Click    ${BTN_CANCEL_PAYMENT}
	Verify Screen Title         ${SCREEN_TITLE_TEXT}        Manage this payment
	Input Text    ${CANCEL_REASON_FIELD}        Schedule Payment Cancellation
	Wait Until Element Is Ready And Click    ${DONE_BTN}
	Transaction Verification
	Verify Screen Title         ${SCREEN_TITLE_TEXT}        Scheduled payments

Schedule Payment Filtering For
	[Arguments]    ${TRANS_TYPE}
	Scroll Right the App
	Click Schedule Payment Filter Transaction      ${TRANS_TYPE}
	Verify Screen Title    ${TRANS_TYPE_TITLE}     ${TRANS_TYPE}

