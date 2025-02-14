*** Settings ***
Library   AppiumLibrary
Library    BuiltIn
Library  Screenshot    default_directory=../Screenshots
Variables    ../Locators/TransactMenuScreen.py
Variables    ../Locators/WithdrawCashScreen.py
Variables    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/TestData/TestData.py
Resource    ../KeywordDefinitions/CommonFunctions.robot
Library    OperatingSystem
#Variables    /Users/martinsadeyeye/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/TestData/TestData.py


*** Variables ***
${CONTAINER_BOUNDS}    [0,857][1080,2088]
${START_X}             540   # Middle of the container width
${START_Y}             2000  # Slightly above the bottom edge
${END_X}               540   # Same as START_X
${END_Y}               900   # Slightly below the top edge
*** Keywords ***
Click on Transact Menu
	Click Menu Item     Transact

Click Send Money to Own Equity Account Menu
	Click Transaction Items     Own Equity account
	
Enter amount to send
    [Arguments]    ${AMOUNT_OWN}
    click element    ${OWN_AMOUNT_FIELD}
    Input Text     ${OWN_AMOUNT_FIELD}    ${AMOUNT_OWN}
    Wait Until Element Is Ready And Click      ${SEND_OWN_BUTTON}

# send to own
Confirmation screen
    [Documentation]    checking that the text on the confirmation screen is the expected one
    Wait Until Page Contains Element    ${PAY_OWN_BUTTON}
    ${CONFIRMATION_TEXT} =     Get Text    ${CONFIRMATION_SCREEN_TEXT}
    Should Be Equal   ${CONFIRMATION_TEXT}     To continue, please confirm your transaction
    click element    ${PAY_OWN_BUTTON}

completing the transaction
    Wait Until Page Contains Element      ${TRANSACTION_DONE_BUTTON}    20s
    ${COMPLETE_TRAN_TEXT} =    Get Text    ${TRAN_COMPLETE_TEXT}
    Should Be Equal    ${COMPLETE_TRAN_TEXT}    Great! Your transaction was successful.
    Click Element    ${TRANSACTION_DONE_BUTTON}

Select Source Account
    Wait Until Element Is Ready And Click        ${SEND_FROM_FIELD}
    #Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Pay from
    Wait Until Page Contains Element     ${SCREEN_TITLE_TEXT}
    Wait Until Element Is Ready And Click        ${FIRST_ACCOUNT}

Select USD Source Account
    Wait Until Element Is Ready And Click        ${SEND_FROM_FIELD}
    #Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Pay from
    Wait Until Page Contains Element    ${SCREEN_TITLE_TEXT}
    Wait Until Element Is Ready And Click        ${SELECT_SOURCE_ACC_FIELD}

Select Destination Account
	Wait Until Element Is Ready And Click         ${SEND_TO_FIELD}
	#Verify Screen Title                           ${SCREEN_TITLE_TEXT}       Send to
	Wait Until Page Contains Element     ${SCREEN_TITLE_TEXT}
	Wait Until Element Is Ready And Click         ${SEND_TO_BUTTON}
    Own Currency Account        ${user_subsidiary["LOCAL_CURRENCY"]}



Enter Amount
	[Arguments]    ${TRANSFER_AMOUNT}
	Input Text      ${AMOUNT_TXT_FIELD}          ${TRANSFER_AMOUNT}

Clear Amount
	 Clear Text      ${AMOUNT_TXT_FIELD}

Click Amount Field
	Click Element   ${AMOUNT_TXT_FIELD}

Enter Payment Reason
	[Arguments]   ${PAYMENT_REASON_MESSAGE}
	Input Text    ${PAYMENT_REASON_FIELD}       ${PAYMENT_REASON_MESSAGE}

Click on Send Money Button
	Wait Until Element Is Ready And Click        ${SEND_MONEY_CONFIRMATION}

Verify Payment Confirmation
	Verify Screen Title     ${SCREEN_TITLE_TEXT}     Payment confirmation
	Wait Until Element Is Ready          ${CHARGED_FEE}
	${ACTUAL_FEE_CHARGED}=  Get Text    ${CHARGED_FEE}
	Log To Console    Charge Fee for this Transaction is ${ACTUAL_FEE_CHARGED}

Verify WU Payment Confirmation
	Verify Screen Title     ${SCREEN_TITLE_TEXT}     Payment confirmation

Charge Fee Verification
	[Arguments]   ${FEE_CHARGED}
	Wait Until Element Is Ready          ${CHARGED_FEE}
	${ACTUAL_FEE_CHARGED}=  Get Text            ${CHARGED_FEE}
	Should Be Equal As Strings           ${ACTUAL_FEE_CHARGED}             ${FEE_CHARGED}
	Should Contain    ${FEE_CHARGED}             ${FEE_CHARGED}


Confirm and Send
	Wait Until Element Is Ready And Click        ${SEND_MONEY_CONFIRMATION}

Verify that the transaction is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!
	Verify Screen Title    ${DOWNLOAD_RECEIPT_BUTTON}       Download receipt

Verify that the Agent Withdrawal transaction is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESS_MESSAGE_FIELD1}     Great!
	Verify Screen Title    ${SUCCESS_MESSAGE_FIELD2}       Your transaction was successful
	Verify Screen Title    ${CODE_VALIDITY_FIELD}       This code is valid for 5 minutes.

Verify that Intercountry transaction is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}         Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!
	Verify Screen Title    ${SUCCESS_DETAILS_FEEDBACK_FIELD}    Great! Your transfer was successful.
	Verify Screen Title    ${DOWNLOAD_RECEIPT_BUTTON}       Download receipt
	Verify Screen Title    	${CONVERSION_RATE_LABEL}        Exchange rate
	Verify Screen Title    	${CONVERTED_FEE_LABEL}          Converted Charges:

Click Send Money to Another Equity account Menu
	Click Transaction Items     Another Equity account

Click Send To Someone New
	Wait Until Element Is Ready And Click        ${SEND_TO_FIELD}
	#Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Send to
	#Wait Until Element Is Ready And Click        ${SEND_TO_SOMEONE_NEW_BUTTON}
	
Send to Someone New if element is available
    ${is_someone_new}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${SEND_TO_SOMEONE_NEW_BUTTON}
    Run Keyword If    ${is_someone_new}    Click Send To Someone New

Enter Account Number
	[Arguments]    ${ACCOUNT_NUMBER}
	#Verify Screen Title        ${SCREEN_TITLE_TEXT}         Send to someone new
	Input Text    ${ACCOUNT_NUMBER_INPUT_FIELD}          ${ACCOUNT_NUMBER}

Click on Continue to Add Beneficiary
	Wait Until Element Is Ready And Click        ${ADD_BENEFICIARY_CONTINUE_BUTTON}
	#Wait Until Element Is Ready And Click       ${OK_RECEIPT_HIDDEN_BUTTON_ON_MODAL}

Click Continue to Add Beneficiary
    Wait Until Element Is Ready And Click        ${ADD_BENEFICIARY_CONTINUE_BUTTON}
    ${IS_VISIBLE}   Run Keyword And Return Status   Wait Until Element Is Visible      ${OK_RECEIPT_HIDDEN_BUTTON_ON_MODAL}
    Run Keyword If     '${IS_VISIBLE}' == 'True'     Click Element        ${OK_RECEIPT_HIDDEN_BUTTON_ON_MODAL}
    Sleep    5 sec

Click Send Money to Another Bank Menu
	Click Transaction Items     Another Bank

Select bank and enter account
    #[Arguments]    ${bank}    ${account}
    Wait Until Element Is Ready And Click    ${ANOTHER_BANK_NAV}
    Wait Until Element Is Ready And Click    ${SOMEONE_NEW_NAV}
    Wait Until Page Contains Element     ${SEARCH_ANOTHER_BANK}
    ${SELECTION_CONFIRMATION} =   Get Text    ${SELECT_COUNTRY_TEXT}
    Should Be Equal   ${SELECTION_CONFIRMATION}    Please select the recipient’s bank
    Wait Until Page Contains Element    ${SEARCH_ANOTHER_BANK}
    sleep   10s
    Scroll Element Into View

#Scroll Element Into View
    [Documentation]    Scroll through the container until the target element is visible.
    Wait Until Page Contains Element    ${BANKS_LIST_CONTAINER}

    WHILE    not    Run Keyword And Return Status    Element Should Be Visible    ${STANBIC_BANK_UG}
        Swipe    start_x=${START_X}    start_y=${START_Y}    end_x=${END_X}    end_y=${END_Y}    duration=500
        ${is_at_end}=    Run Keyword And Return Status    Page Should Contain Element    ${END_MARKER}
        Run Keyword If    ${is_at_end}    Exit For Loop
        ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${STANBIC_BANK_UG}
    END

    Wait Until Element Is Visible    ${STANBIC_BANK_UG}    timeout=5s
    Click Element    ${STANBIC_BANK_UG}







# RTGS accounts
# UG
#1. Stanbic 9030016855536, 903008646022, 9030010157667
#2. Absa  6005247185,   6004495460,    60034782228

#KE
# 1. Absa  2036752376,
# 2. Standard Chartered   0100369991000

# RW
# 1. bank of kigali 002570635184933

# SS
# 1. KCB    5500108786
# 2. Ecobank    0010087701130001

# TZ
# National Microfinance Bank    62308000712


#select bank
    #${IS_UG_TAG}    Run Keyword And Return Status      Is Tag Present     UG
    #Run Keyword If    ${IS_UG_TAG}    Scroll Until Visible and click
    
    
#sroll to the bank to select UG(Stanbic)
    #Click Element    ${STANBIC_BANK_UG}

Enter Bank Account Number
    [Arguments]    ${BANK_ACCOUNT_NUMBER}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to someone new
	Input Text    ${ACCOUNT_NUMBER_VALUE_FIELD}         ${BANK_ACCOUNT_NUMBER}

Enter Full Name
	[Arguments]    ${FULL_NAME}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to someone new
	Input Text    ${FULL_NAME_FIELD}                     ${FULL_NAME}

Verify Transfer Service Label
	Wait Until Element Is Ready            ${TRANSFER_SERVICE_LABEL}
	${LABEL-TEXT}=  Get Text                ${TRANSFER_SERVICE_LABEL}
	Should Be Equal As Strings              ${LABEL-TEXT}                      Transfer service

Select a Transfer service
	Wait Until Element Is Ready And Click    ${TRANSFER_SERVICE_BUTTON}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Transfer service

Select Transfer Service
    Wait Until Element Is Ready And Click    ${TRANSFER_SERVICE_BUTTON}
    Verify Screen Title       ${SCREEN_TITLE_TEXT}       Transfer service
    Wait Until Element Is Ready And Click    ${SELECT_RTGS_SERVICE}


Select EFT Transfer Service
    Wait Until Element Is Ready And Click    ${TRANSFER_SERVICE_BUTTON}
    Verify Screen Title       ${SCREEN_TITLE_TEXT}       Transfer service
    Wait Until Element Is Ready And Click    ${SELECT_ETF_SERVICE}


Click on Send Money to Phone-Linked Account
	Wait Until Element Is Ready And Click         ${SEND_TO_FIELD}
	Verify Screen Title                           ${SCREEN_TITLE_TEXT}       Send to
	Wait Until Element Is Ready And Click         ${PHONE_LINKED_ACCOUNT_BUTTON}

Enter Mobile Number
    [Arguments]    ${MOBILE_NUMBER}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to someone new
	Input Text    ${MOBILE_NUMBER_VALUE_FIELD}         ${MOBILE_NUMBER}

Select Recipient's Bank
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to someone new
	Wait Until Element Is Ready And Click    ${RECIPIENT_BANK_BUTTON}

Click Send Money to Mobile money
	Click Transaction Items     Mobile money

Select a Mobile Money Telco
	[Arguments]    ${TElCO}
	Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to someone new
	Select a Telco          ${TElCO}

User Verify Save to Favorite Not Available
	${present}=  Run Keyword And Return Status    Element Should Be Visible    ${ADD_TO_FAVORITE_BUTTON}
    Run Keyword If    '${present}' == 'False'    Log To Console    Favourite Feature not available

Select Beneficiary from Favorites
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	Wait Until Element Is Ready And Click        ${SEND_TO_FIELD}
	Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Send to
	Input Text    ${SEARCH_FOR_A_BENEFICIARY}       ${FAVOURITE_NAME_OR_NUMBER}
	Wait Until Element Is Ready And Click    ${SELECT_FAVOURITE_SEARCH_OUTCOME}

Select Beneficiary from Favorites for Another Bank
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	Wait Until Element Is Ready And Click        ${SEND_TO_FIELD}
	Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Send to
	Input Text    ${SEARCH_FOR_A_BENEFICIARY}       ${FAVOURITE_NAME_OR_NUMBER}
	Wait Until Element Is Ready And Click    ${BTN_RADIO_BENEFICIARY_FAVOURITE_SEARCH_OUTCOME}
	Sleep  10sec


Select Destination Country
    [Arguments]    ${COUNTRY_NAME}      ${SWIFT_BANK_NAME}
    Wait Until Page Contains Element    ${SEARCH_FOR_A_BENEFICIARY}    10s
	Click Element    ${NAV_TO_SEARCH_BANK}
	Wait Until Page Contains Element    ${SEARCH_FOR_A_BENEFICIARY}    10s
	Wait Until Element Is Ready And Click    ${SELECT_COUNTRY_FIELD}
	#Verify Screen Title                      ${SCREEN_TITLE_TEXT}      Please select a country
	Wait Until Page Contains Element    ${SEARCH_FOR_A_BENEFICIARY}    10s
	Input Text    ${SEARCH_FOR_A_BENEFICIARY}            ${COUNTRY_NAME}
    Wait Until Element Is Ready And Click    ${SEARCH_RESULT_COUNTRY_LIST}
    Verify Screen Title                      ${SCREEN_TITLE_TEXT}      Send to a bank account
    Input Text    ${SEARCH_FOR_A_BENEFICIARY}            ${SWIFT_BANK_NAME}
    Wait Until Element Is Ready And Click    ${SELECT_A_BANK_RESULT}

Enter FUll Name Account Number and Address
	[Arguments]    ${FULL_NAME}     ${ACCOUNT_IBAN_NUMBER}
	Verify Screen Title                      ${SCREEN_TITLE_TEXT}      Send to someone new
	Input Text    ${FULL_NAME_FIELD}         ${FULL_NAME}
	Input Text    ${ACCOUNT_NUMBER_VALUE_FIELD}     ${ACCOUNT_IBAN_NUMBER}
	Input Text    ${PHYSICAL_ADDRESS_FIELD}            My Swift Address in Italy

Select Currency
	Wait Until Element Is Ready And Click    ${SElECT_CURRENCY}
	Verify Screen Title                      ${SCREEN_TITLE_TEXT}      Currency
	#Click on Preferred Currency         ${PREFERRED_CURRENCY}
	Click Element           ${USD_CURRENCY_FIELD}
	Verify Screen Title    	${EXCHANGE_RATE_FIELD}        Exchange rate
	Verify Screen Title    	${CONVERTED_AMOUNT_FIELD}     Converted amount

Select Charge Option
    #Scroll Element Into View    ${SELECT_FOREIGN_CHARGE_OPTION_FIELD}
    Scroll To Element Using UiScrollable for the foreign charge option
	Wait Until Element Is Ready And Click       ${SELECT_FOREIGN_CHARGE_OPTION_FIELD}
	Verify Screen Title                         ${SCREEN_TITLE_TEXT}      Charge option
	Wait Until Element Is Ready And Click       ${FULL_CHARGE_OPTION}
	Swipe    425    2037    421    1126

Scroll To Element Using UiScrollable for the foreign charge option
    [Documentation]    Scrolls to the element using UiScrollable's scrollIntoView
    ${element}=    Get WebElement    android=new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().resourceId("ke.co.equitygroup.equitymobile.debug:id/itemText"))
    Click Element    ${element}

Select Share Charge Option
	Wait Until Element Is Ready And Click       ${SELECT_FOREIGN_CHARGE_OPTION_FIELD}
	Verify Screen Title                         ${SCREEN_TITLE_TEXT}      Charge option
	Wait Until Element Is Ready And Click       ${SHARE_CHARGE_OPTION}
	Swipe    425    2037    421    1126

Select Payment Category
	Wait Until Element Is Ready And Click       ${SELECT_PAYMENT_CATEGORY}
	Verify Screen Title                         ${SCREEN_TITLE_TEXT}             Payment category
	Input Text                                  ${SEARCH_FOR_A_BENEFICIARY}      Food
	Wait Until Element Is Ready And Click       ${SELECT_A_BANK_RESULT}

Verify Full charge and Converted Rate
	Verify Screen Title         ${EXCHANGE_CONVERSION_RATE_CONFIRMATION}        1 USD -
	Verify Screen Title         ${CONVERTED_LABEL}              Converted amount
	Verify Screen Title         ${FULL_CHARGE_NARRATION}        You own the full charge, so your recipient will not be charged

Verify Share charge and Converted Rate
	Verify Screen Title         ${EXCHANGE_CONVERSION_RATE_CONFIRMATION}        1 USD -
	Verify Screen Title         ${CONVERTED_LABEL}              Converted amount
	Verify Screen Title         ${FULL_CHARGE_NARRATION}        This charge is shared, so your recipient will be charged the same amount

Upload Supporting Documents
	Verify Screen Title    ${UPLOAD_DOCUMENT_HEADER}        Upload documents
	Wait Until Element Is Ready And Click    ${UPLOAD_DOCUMENT_BUTTON}
	Verify Screen Title          ${SCREEN_TITLE_FIELD}	    Supporting documents
    Input Text    ${ADDITIONAL_INFORMATION_FIELD}       Uploading HV Support Document
	Wait Until Element Is Ready And Click    ${ADD_DOCUMENT_BUTTON}
#	Sleep  10 sec
	#Copy File   /Users/martinsadeyeye/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/Documents/Document1.pdf      ${SELECT_FILE}
#	${My_FILE}=     Get File    /Users/martinsadeyeye/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/Resources/Documents/Document1.pdf
#    Wait Until Element Is Ready And Click    ${My_FILE}
    #Wait Until Element Is Ready And Click    ${SELECT_FILE}
     Wait Until Element Is Ready And Click       ${FILE_UPLOADED}
     Wait Until Element Is Ready And Click       ${ADD_UPLOAD_BUTTON}

Send Money To Own Equity Account
    [Documentation]    Send money to other Equity Account
    ${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
    #Select Source Account
    Select Destination Account
    Enter Amount          ${random_number}
    Enter Payment Reason       Sending Money to Own Equity Account
    Click on Send Money Button
    Verify Payment Confirmation
    Charge Fee Verification     ${user_subsidiary["No_charge_fee"]}
    Confirm and Send
#    Transaction Verification
    User Verify Save to Favorite Not Available
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Own Equity Account For Favourite
    [Documentation]    Send money to other Equity Account
    ${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
    #Select Source Account
    Select Destination Account
    Enter Amount          ${random_number}
    Enter Payment Reason       Sending Money to Own Equity Account
    Click on Send Money Button
    Verify Payment Confirmation
    Charge Fee Verification     ${user_subsidiary["No_charge_fee"]}
    Confirm and Send
    User Verify Save to Favorite Not Available
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Equity Account
	[Documentation]    Send money to other Equity Account
	#${random_number}    Evaluate    random.randint(1050, 1100)
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
	Click Send To Someone New
	#Enter Account Number        ${ANOTHER_EQUITY_ACCOUNT}
	Enter Account Number        ${user_subsidiary["intra_destination_account"]}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason       Sending Money to Another Equity Account
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["intra_destination_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Enter recipient of another equity transaction
    Wait Until Element Is Ready And Click    ${SOMEONE_NEW_NAV}
    sleep    10s

Enter Account number of another equity beneficiary
    [Arguments]    ${ACCOUNT_NO}
    Wait Until Page Contains Element        ${ACCOUNT_FIELD}     20S
    Input Text    ${ACCOUNT_FIELD}    ${ACCOUNT_NO}
    Click Element    ${CONTINUE_SUBMIT}

Click Pay To Card Menu
	Click Transaction Items     Pay to card

Pay To Someone New
	Wait Until Element Is Ready And Click        ${SEND_TO_FIELD}
	Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Pay to
	Wait Until Element Is Ready And Click        ${SEND_TO_BUTTON}

Click on Pay Button
    Wait Until Element Is Ready And Click    ${PAY_BUTTON}

Confirm and Pay
	Wait Until Element Is Ready And Click    ${PAY_CONFIRMATION_BUTTON}

Verify that Pay To Card transaction is Successful
	Wait Until Element Is Ready    ${CONFIRMED_TITLE_FIELD}
	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}             Confirmed
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}         Great!
	Verify Screen Title    ${DOWNLOAD_PAY_RECEIPT_BUTTON}      	Download receipt
	Verify Screen Title    ${SUCCESS_DETAILS_FEEDBACK_FIELD}    Great! Your transfer was successful.

Send Money-Pay To Card
	[Documentation]    Send Money-Pay To Card
	${random_number}    Evaluate    random.randint(${user_subsidiary["payToCardMinimum"]}, ${user_subsidiary["payToCardMaximum"]})
    Pay To Someone New
	Enter Amount         ${random_number}
	Enter Payment Reason      Send Money-Pay To Card
	Click on Pay Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["pay_to_card_charge_fee"]}
	Confirm and Pay
	Transaction Verification
	Verify that Pay To Card transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Transact


Send Money To Favourite Equity Account/Number
	[Documentation]    Send money to Another Equity Account
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
	Select Beneficiary from Favorites for Another Bank      ${FAVOURITE_NAME_OR_NUMBER}
	Enter Amount         ${random_number}
	Enter Payment Reason       Sending Money to Another Equity Account
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["intra_destination_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
#	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Bank Favourite
	[Documentation]    Send money to other Equity Account
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["RTGS_minimum"]}, ${user_subsidiary["RTGS_maximum"]})
	Select Beneficiary from Favorites for Another Bank       ${FAVOURITE_NAME_OR_NUMBER}
	Enter Amount         ${random_number}
	Select Transfer Service
	Enter Payment Reason       Send Money To Another Bank Favourite
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["RTGS_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Phone-Linked Favourite
	[Documentation]    Send Money To Phone-Linked Favourite
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
	Select Beneficiary from Favorites for Another Bank       ${FAVOURITE_NAME_OR_NUMBER}
	Enter Amount         ${random_number}
	Enter Payment Reason       Send Money To Phone-Linked Favourite
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["RTGS_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Bank
	[Documentation]    Send money to Another Bank
	${random_number}    Evaluate    random.randint(${user_subsidiary["RTGS_minimum"]}, ${user_subsidiary["RTGS_maximum"]})
	#Send to Someone New if element is available
	Click Send To Someone New
	Search and Select a Bank        ${user_subsidiary["RTGS_destination_name"]}
	Enter Bank Account Number       ${user_subsidiary["RTGS_destination_account"]}
	Click Continue to Add Beneficiary
	Enter Full Name                 ${user_subsidiary["RTGS_destination_name"]} DOE
	Click Continue to Add Beneficiary
	Enter Amount         ${random_number}
	#Verify Transfer Service Label
	#Select Transfer Service
	Enter Payment Reason       Sending Money to Another Equity Account
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["RTGS_charge_fee"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Bank EFT
	[Documentation]    Send money to Another Bank
	${random_number}    Evaluate    random.randint(${user_subsidiary["RTGS_minimum"]}, ${user_subsidiary["RTGS_maximum"]})
	Click Send To Someone New
	Search and Select a Bank        ${user_subsidiary["RTGS_destination_name"]}
	Enter Bank Account Number       ${user_subsidiary["RTGS_destination_account"]}
	Click Continue to Add Beneficiary
	Enter Full Name                 ${user_subsidiary["RTGS_destination_name"]} DOE
	Click Continue to Add Beneficiary
	Enter Amount         ${random_number}
	#Verify Transfer Service Label
	#Select EFT Transfer Service
	Enter Payment Reason       Sending Money to Another Equity Account
	Click on Send Money Button
	Verify Payment Confirmation
	#Charge Fee Verification     ${user_subsidiary["RTGS_ETF_charge_fee"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Search and Select a Bank
	[Arguments]    ${BANK_NAME}
	#Verify Screen Title     ${SCREEN_TITLE_TEXT}        Send to a bank account
	Wait Until Page Contains Element    ${SEARCH_FOR_A_BENEFICIARY}    10s
	Click Element    ${NAV_TO_SEARCH_BANK}
	Wait Until Page Contains Element    ${SEARCH_FOR_A_BENEFICIARY}    10s
	Input Text    ${SEARCH_FOR_A_BENEFICIARY}            ${BANK_NAME}
    Wait Until Element Is Ready And Click    ${SELECT_A_BANK_RESULT}



Send Money To Pesalink Mobile
    [Documentation]     Send to Pesalink Mobile
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
    Click on Send Money to Phone-Linked Account
    Enter Mobile Number        ${user_subsidiary["PESALINK_NUMBER"]}
    Click Continue to Add Beneficiary
    Select Recipient's Bank
    Enter Amount          ${random_number}
	Enter Payment Reason       Sending Money to Pesalink
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["transaction_charge_fee_pesalink"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To other bank account Pesalink phone linked
    [Documentation]     Send to Pesalink Mobile
	${random_number}    Evaluate    random.randint(${user_subsidiary["usdMinimum"]}, ${user_subsidiary["usdMaximum"]})
    Select USD Source Account
    Click on Send Money to Phone-Linked Account
    Enter Mobile Number        ${user_subsidiary["PESALINK_NUMBER"]}
    Click Continue to Add Beneficiary
    Select Recipient's Bank
    Enter Amount          ${random_number}
	Enter Payment Reason       Sending Money to Account Pesalink phone linked
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["usd_pesalink_charge_fee"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Mobile Money
	[Documentation]    Send money to mobile money
    [Arguments]    ${MOBILEMONEY_TELCOS}    ${PHONE_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["mobileMoneyMinimum"]}, ${user_subsidiary["mobileMoneyMaximum"]})
    Click Send To Someone New
    Select a Mobile Money Telco     ${MOBILEMONEY_TELCOS}
    Enter Mobile Number             ${PHONE_NUMBER}
    Click Continue to Add Beneficiary
    Enter Amount          ${random_number}
	Enter Payment Reason       Sending Money to ${MOBILEMONEY_TELCOS} Mobile Money
	Click on Send Money Button
	Verify Payment Confirmation
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Airtel Mobile Money
    Send Money To Mobile Money      ${user_subsidiary["MOBILE_MONEY_TELCOS"]["AirtelMoney"]}     ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}

Send Money To Vodacom Mobile Money
    Send Money To Mobile Money      ${user_subsidiary["MOBILE_MONEY_TELCOS"]["VodacomMpesa"]}     ${user_subsidiary["PHONE_NUMBER"]["Vodacom"]}

Send Money To MPESA Mobile Money
    Send Money To Mobile Money       ${user_subsidiary["MOBILE_MONEY_TELCOS"]["MPESA"]}     ${user_subsidiary["PHONE_NUMBER"]["MPESA"]}

Send Money To T-Kash Mobile Money
    Send Money To Mobile Money      ${user_subsidiary["MOBILE_MONEY_TELCOS"]["TKash"]}     ${user_subsidiary["PHONE_NUMBER"]["TKash"]}


Send Money To Mobile Money Favourites
	[Documentation]    Send Money To Mobile Money Favourites
	[Arguments]    ${FAVOURITE_NAME_OR_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["minimum"]}, ${user_subsidiary["maximum"]})
	Select Beneficiary from Favorites for Another Bank       ${FAVOURITE_NAME_OR_NUMBER}
	Enter Amount         ${random_number}
	Enter Payment Reason       Sending Money to MM Favourite
	Click on Send Money Button
	Verify Payment Confirmation
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Bank SWIFT
	[Documentation]    Send Money To Another Bank SWIFT
	${random_number}    Evaluate    random.randint(${user_subsidiary["usdMinimum"]}, ${user_subsidiary["usdMaximum"]})
	Click Send To Someone New
	Select Destination Country      ${user_subsidiary["SWIFT_COUNTRY"]}     ${user_subsidiary["SWIFT_BANK_CODE"]}
    Enter FUll Name Account Number and Address      ${user_subsidiary["SWIFT_COUNTRY"]} SWIFT     ${user_subsidiary["SWIFT_ACCOUNT"]}
    Click Continue to Add Beneficiary
    Select Currency
	Enter Amount         ${random_number}
	Select Charge Option
	Enter Payment Reason       Send Money To Another Bank SWIFT
	Select Payment Category
	Click on Send Money Button
	Verify Payment Confirmation
	Verify FUll charge and Converted Rate
	Charge Fee Verification     ${user_subsidiary["swift_full_charge_fee"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

Send Money To Another Bank SWIFT-Share Charges
	[Documentation]    Send Money To Another Bank SWIFT
	${random_number}    Evaluate    random.randint(${user_subsidiary["usdMinimum"]}, ${user_subsidiary["usdMaximum"]})
	Click Send To Someone New
	Select Destination Country      ${user_subsidiary["SWIFT_COUNTRY"]}     ${user_subsidiary["SWIFT_BANK_CODE"]}
    Enter FUll Name Account Number and Address      ${user_subsidiary["SWIFT_COUNTRY"]} SWIFT     ${user_subsidiary["SWIFT_ACCOUNT"]}
    Click Continue to Add Beneficiary
    Select Currency
	Enter Amount         ${random_number}
	Select Share Charge Option
	Enter Payment Reason       Send Money To Another Bank SWIFT
	Select Payment Category
	Click on Send Money Button
	Verify Payment Confirmation
	Verify Share charge and Converted Rate
	Charge Fee Verification     ${user_subsidiary["swift_full_charge_fee"]}
	Confirm and Send
    Transaction Verification
    Verify that the transaction is Successful
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home


High Value Transaction to Another Equity Account
	[Documentation]    High Value Transaction to Another Equity Account
	${random_number}    Evaluate    random.randint(${user_subsidiary["highValueMinimum"]}, ${user_subsidiary["highValueMaximum"]})
	Click Send To Someone New
	Enter Account Number      ${user_subsidiary["intra_destination_account"]}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason       High Value Transaction To Equity Account
    Upload Supporting Documents
    Click on Send Money Button
    Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["transaction_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Pick a Country from Dropdown
	Wait Until Element Is Ready And Click    ${SELECT_RECIPIENT_COUNTRY}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}    Country

Send Money to
	[Arguments]    ${DESTINATION_COUNTRY}       ${ANOTHER_EQUITY_ACCOUNT}
	[Documentation]    Send money from  ${current_user["subsidiary"]} to ${DESTINATION_COUNTRY} -Other Equity Account
	${random_number}    Evaluate    random.randint(${user_subsidiary["InterCountryMinimum"]}, ${user_subsidiary["InterCountryMaximum"]})
	Click Send To Someone New
	Pick a Country from Dropdown
	Select Country      ${DESTINATION_COUNTRY}
	Enter Account Number        ${ANOTHER_EQUITY_ACCOUNT}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Verify Screen Title    	${EXCHANGE_RATE_FIELD}        Exchange rate
	Verify Screen Title    	${CONVERTED_AMOUNT_FIELD}     Converted amount
	Enter Payment Reason       Send money from ${current_user["subsidiary"]} to ${DESTINATION_COUNTRY}
	Click on Send Money Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["interCountry_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that Intercountry transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home


Send Money to Another Equity account In Uganda
	Send Money to  ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_EQUITY_ACCOUNT"]}

Send Money to Another Equity account In Tanzania
	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_EQUITY_ACCOUNT"]}

Send Money to Another Equity account In Rwanda
	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_EQUITY_ACCOUNT"]}

Send Money to Another Equity account In Kenya
	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_EQUITY_ACCOUNT"]}

Send Money to Another Equity account In South Sudan
	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_EQUITY_ACCOUNT"]}


Send Money to USD
	[Arguments]    ${DESTINATION_COUNTRY}       ${ANOTHER_EQUITY_ACCOUNT}
	[Documentation]    Send money from KES to ${DESTINATION_COUNTRY} -Other Equity Account
	${random_number}    Evaluate    random.randint(${user_subsidiary["localAmountToUSD_minimum"]}, ${user_subsidiary["localAmountToUSD_maximum"]})
	Click Send To Someone New
	Pick a Country from Dropdown
	Select Country      ${DESTINATION_COUNTRY}
	Enter Account Number        ${ANOTHER_EQUITY_ACCOUNT}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Verify Screen Title    	${EXCHANGE_RATE_FIELD}        Exchange rate
	Verify Screen Title    	${CONVERTED_AMOUNT_FIELD}     Converted amount
	Enter Payment Reason      Send money from ${current_user["subsidiary"]} to ${DESTINATION_COUNTRY} USD
	Click on Send Money Button
	Verify Payment Confirmation
#	Charge Fee Verification     ${user_subsidiary["interCountry_charge_fee_"]}
	Confirm and Send
	Transaction Verification
	Verify that Intercountry transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home

Send Money to Another Equity USD account In Uganda
	Send Money to USD  ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_USD_ACCOUNT"]}

Send Money to Another Equity USD account In Tanzania
	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_USD_ACCOUNT"]}

Send Money to Another Equity USD account In Rwanda
	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_USD_ACCOUNT"]}

Send Money to Another Equity USD account In Kenya
	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_USD_ACCOUNT"]}

Send Money to Another Equity USD account In South Sudan
	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_USD_ACCOUNT"]}






Send Money from USD to
	[Arguments]    ${DESTINATION_COUNTRY}       ${ANOTHER_EQUITY_ACCOUNT}
	[Documentation]    Send money from USD to ${DESTINATION_COUNTRY} -Other Equity Account
	${random_number}    Evaluate    random.randint(${user_subsidiary["USDToLocalAmount_minimum"]}, ${user_subsidiary["USDToLocalAmount_maximum"]})
	Select USD Source Account
	Click Send To Someone New
	Pick a Country from Dropdown
	Select Country      ${DESTINATION_COUNTRY}
	Enter Account Number        ${ANOTHER_EQUITY_ACCOUNT}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Verify Screen Title    	${EXCHANGE_RATE_FIELD}        Exchange rate
	Verify Screen Title    	${CONVERTED_AMOUNT_FIELD}     Converted amount
	Enter Payment Reason       Send money from ${current_user["subsidiary"]} USD to ${DESTINATION_COUNTRY}
	Click on Send Money Button
	Verify Payment Confirmation
	#Charge Fee Verification     ${user_subsidiary["interCountry_USD_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that Intercountry transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home


Send Money from USD Account to Local Equity account In Uganda
	Send Money from USD to  ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_EQUITY_ACCOUNT"]}

Send Money from USD Account to Local Equity account In Tanzania
	Send Money from USD to   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_EQUITY_ACCOUNT"]}

Send Money from USD Account to Local Equity account In Rwanda
	Send Money from USD to   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_EQUITY_ACCOUNT"]}

Send Money from USD Account to Local Equity account In Kenya
	Send Money from USD to   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_EQUITY_ACCOUNT"]}

Send Money from USD Account to Local Equity account In South Sudan
	Send Money from USD to   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_EQUITY_ACCOUNT"]}





Send Money from USD to USD
	[Arguments]    ${DESTINATION_COUNTRY}       ${ANOTHER_EQUITY_ACCOUNT}
	[Documentation]    Send money from USD to USD ${DESTINATION_COUNTRY} -Other Equity Account
	${random_number}    Evaluate    random.randint(${user_subsidiary["usdMinimum"]}, ${user_subsidiary["usdMaximum"]})
	Select USD Source Account
	Click Send To Someone New
	Pick a Country from Dropdown
	Select Country      ${DESTINATION_COUNTRY}
	Enter Account Number        ${ANOTHER_EQUITY_ACCOUNT}
	Click on Continue to Add Beneficiary
	Enter Amount         ${random_number}
	Enter Payment Reason       Send money from ${current_user["subsidiary"]} USD to ${DESTINATION_COUNTRY} USD
	Click on Send Money Button
	Verify Payment Confirmation
	#Charge Fee Verification     ${user_subsidiary["interCountry_USD_charge_fee"]}
	Confirm and Send
	Transaction Verification
	Verify that the transaction is Successful
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Home


Send Money From USD to Another Equity USD account In Uganda
	Send Money from USD to USD  ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_USD_ACCOUNT"]}

Send Money From USD to Another Equity USD account In Tanzania
	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_USD_ACCOUNT"]}

Send Money From USD to Another Equity USD account In Rwanda
	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_USD_ACCOUNT"]}

Send Money From USD to Another Equity USD account In Kenya
	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_USD_ACCOUNT"]}

Send Money From USD to Another Equity USD account In South Sudan
	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_USD_ACCOUNT"]}



Click on Western Union
	Scroll Down the App
	Click Transaction Items     Western Union
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Western Union

Select An Account
    Wait Until Element Is Ready And Click        ${SEND_FROM_}
    Verify Screen Title                          ${SCREEN_TITLE_TEXT}       Pay from
    Wait Until Element Is Ready And Click        ${FIRST_ACCOUNT}


Send to - Select Recipient
	Verify Screen Title    ${SCREEN_TITLE_TEXT}      Western Union - Send money
    Wait Until Element Is Ready And Click    ${SEND_TO_FIELD_ON_WU}
    Verify Screen Title       ${SCREEN_TITLE_TEXT}       Send to
    Wait Until Element Is Ready And Click        ${SEND_TO_SOMEONE_NEW_BUTTON}

Select Recipient Details
	[Arguments]    ${F_NAME}   ${M_NAME}    ${L_NAME}
	Wait Until Element Is Ready And Click    ${SELECT_RECIPIENT_DETAILS}
	Verify Screen Title      ${SCREEN_TITLE_FIELD}      Recipient details
	Input Text      ${FIRST_NAME_FIELD}     ${F_NAME}
	Input Text      ${MIDDLE_NAME_FIELD}    ${M_NAME}
	Input Text      ${LAST_NAME_FIELD}      ${L_NAME}
	Wait Until Element Is Ready And Click        ${PURPOSE_OF_TRANSACTION_FIELD}
	Wait Until Element Is Ready And Click    ${PICK_A_PURPOSE}
	Wait Until Element Is Ready And Click        ${RELATIONSHIP_TO_RECEIVER_FIELD}
	Wait Until Element Is Ready And Click    ${PICK_RELATIONSHIP}
	Click on Continue button

Enter Recipient Details
	[Arguments]    ${F_NAME}   ${M_NAME}    ${L_NAME}     ${BANK_NAME}   ${BIC}   ${IBAN}
	Wait Until Element Is Ready And Click    ${SELECT_RECIPIENT_DETAILS}
	Verify Screen Title      ${SCREEN_TITLE_FIELD}      Recipient details
	Sleep    3sec
	Input Text      ${FIRST_NAME_FIELD}     ${F_NAME}
	Input Text      ${MIDDLE_NAME_FIELD}    ${M_NAME}
	Input Text      ${LAST_NAME_FIELD}      ${L_NAME}
	Input Text      ${TXT_Bank_Name}      ${BANK_NAME}
	Input Text      ${TXT_BIC}      ${BIC}
	Input Text      ${TXT_IBAN}      ${IBAN}
    Scroll into the View
	Wait Until Element Is Ready And Click    ${PURPOSE_OF_TRANSACTION_FIELD}
	Wait Until Element Is Ready And Click    ${PICK_A_PURPOSE}
	Wait Until Element Is Ready And Click     ${PURPOSE2_OF_TRANSACTION_FIELD}
	Wait Until Element Is Ready And Click    ${PICK_A_PURPOSE}
	Wait Until Element Is Ready And Click     ${RELATIONSHIP_TO_RECEIVER_FIELD}
	Wait Until Element Is Ready And Click    ${PICK_RELATIONSHIP}
	Click on Continue button


Input Delivery Method Details
	[Arguments]    ${COUNTRY_NAME}
	Verify Screen Title     ${WU_HEADER_CARD_FIELD}     Please input delivery method details
	Click Element    ${COUNTRY_SELECTION}
	Verify Screen Title      ${SCREEN_TITLE_TEXT}       Country
	Click Element    ${SEARCH_FIELD}
	Input Text    ${SEARCH_FIELD}      ${COUNTRY_NAME}
	Click Element    ${BTN_RADIO_BENEFICIARY_FAVOURITE_SEARCH_OUTCOME}
	Wait Until Element Is Ready And Click    ${DELIVERY_METHOD_FIELD}

Enter Street Address
	Input Text    ${STREET_ADDRESS_FIELD}      123 Address

Select City
	[Arguments]    ${CITY_NAME}
	Wait Until Element Is Ready And Click    ${SELECT_CITY_FIELD}
	Verify Screen Title      ${SCREEN_TITLE_TEXT}      City
	Click Element    ${SEARCH_FIELD}
	Input Text       ${SEARCH_FIELD}      ${CITY_NAME}
	Click Element    ${BTN_RADIO_BENEFICIARY_FAVOURITE_SEARCH_OUTCOME}

Accept Western Union Policy
	Wait Until Element Is Ready And Click    ${CHK_WESTERN_UNION_POLICY}

Confirm Western Union Transfer
	Wait Until Element Is Ready And Click    ${BTN_WU_CONFIRM}

Verify that the WU transaction is Successful
	Verify Screen Title    ${SUCCESSFUL_FEEDBACK_FIELD}     Great!
	Verify Screen Title    ${DOWNLOAD_RECEIPT_BUTTON}       Download receipt
	Verify Screen Title    ${SUCCESS_DETAILS_FEEDBACK_FIELD}    Your money was sent successfully

Click on WU Done Button
	Wait Until Element Is Ready And Click    ${BTN_WU_CONFIRM}

Send Money-Western Union Internationally to Bank
    [Arguments]     ${TRANSACTION_TYPES}    ${COUNTRY_NAME}   ${DELIVERY_METHOD}    ${F_NAME}    ${M_NAME}    ${L_NAME}     ${CITY_NAME}
    ${random_number}    Evaluate    random.randint(${user_subsidiary["WesterUnionMin"]}, ${user_subsidiary["WesterUnionMax"]})
	Click Western Union Transaction Type        ${TRANSACTION_TYPES}
	Select An Account
	Send to - Select Recipient
	Input Delivery Method Details     ${COUNTRY_NAME}
	Select Delivery Method     ${DELIVERY_METHOD}
	Select Recipient Details    ${F_NAME}   ${M_NAME}   ${L_NAME}
	Click on Continue button
	Enter Amount     ${random_number}
	Enter Street Address
    Select City     ${CITY_NAME}
	Enter Payment Reason       Sending WU from ${current_user["subsidiary"]} to ${COUNTRY_NAME}
	Click on Send Money Button
	Verify Payment Confirmation
	#Charge Fee Verification     ${user_subsidiary["WesterUnion_charge_fee"]}
	Accept Western Union Policy
	Confirm Western Union Transfer
	Transaction Verification
	Verify that the WU transaction is Successful
	Click on WU Done Button
	Verify Screen Title    ${MAIN_TITLE}    Transact


Send Money-Western Union Internationally to Direct to bank
    [Arguments]     ${TRANSACTION_TYPES}    ${COUNTRY_NAME}   ${DELIVERY_METHOD}    ${F_NAME}    ${M_NAME}    ${L_NAME}   ${BANK_NAME}   ${BIC}   ${IBAN}    ${CITY_NAME}
    ${random_number}    Evaluate    random.randint(${user_subsidiary["WesterUnionMin"]}, ${user_subsidiary["WesterUnionMax"]})
	Click Western Union Transaction Type        ${TRANSACTION_TYPES}
	Select An Account
	Send to - Select Recipient
	Input Delivery Method Details     ${COUNTRY_NAME}
	Select Delivery Method     ${DELIVERY_METHOD}
	Enter Recipient Details   ${F_NAME}   ${M_NAME}    ${L_NAME}   ${BANK_NAME}   ${BIC}   ${IBAN}
	Click on Continue button
	Sleep    3sec
	Enter Amount     ${random_number}
	Enter Street Address
    Select City     ${CITY_NAME}
	Enter Payment Reason       Sending WU from ${current_user["subsidiary"]} to ${COUNTRY_NAME}
	Click on Send Money Button
	Verify Payment Confirmation
	#Charge Fee Verification     ${user_subsidiary["WesterUnion_charge_fee"]}
	Accept Western Union Policy
	Confirm Western Union Transfer
	Transaction Verification
	Verify that the WU transaction is Successful
	Click on WU Done Button
	Verify Screen Title    ${MAIN_TITLE}    Transact

Send Money-Western Union Internationally to Cash Pickup
#    Under transact, select Western Union.
#    Click on the transaction type.
#    Select the debit account.
#    click on send to and send to someone new.
#    Click a supported country from the Dropdown menu.
#    Click on the state and pick any from the provided list.
#    Select the delivery method.
#    Provide the recipient details, Names, City, purpose of transaction, and relationship.
#    Provide the amount of payment, street address, and sender city.
#    Click on the Send Money button.
#    Confirm the payment details and click the send money button.

Recieve Money using Western Union Tracking Number

Check For Error
#	Wait Until Element Is Visible    ${TRY_AGAIN_BUTTON}
#	${ERROR_DESCRIPTION}=  Get Text            ${LOGIN_ERROR_DESCRIPTION}
#	Should Be Equal As Strings    ${ERROR_DESCRIPTION}        We are currently unable to complete your request. Please try again later.
    Sleep  10sec
    Click Element    ${CLOSE_TRY_AGAIN_BUTTON}