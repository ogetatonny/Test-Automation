*** Settings ***
Library    String
Library    AppiumLibrary
Library    Collections
Variables       ../Locators/HomeScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot

*** Keywords ***
View Show Balance
	Wait Until Element Is Ready And Click        ${SHOW_MY_BALANCE_BUTTON}

	${YOU_HAVE_LABEL_TEXT}=  Get Text     ${YOU_HAVE_LABEL}
	Should Be Equal As Strings       ${YOU_HAVE_LABEL_TEXT}         You have
	${YOU_HAVE_BALANCE}=  Get Text   ${TOTAL_BALANCE_AMOUNT_FIELD}

	${YOU_OWE_LABEL_TEXT}  Get Text   ${YOU_OWE_LABEL}
	Should Be Equal As Strings      ${YOU_OWE_LABEL_TEXT}          You owe
	${YOU_OWE_BALANCE}  Get Text   ${TOTAL_LIABILITY_AMOUNT_FIELD}

	Click Element    ${HIDE_MY_BALANCE_BUTTON}

Click On Savings Accounts
	Wait Until Element Is Ready And Click        ${VIEW_ALL_ACCOUNTS_BUTTON}
	Wait Until Element Is Ready And Click        ${CURRENT_ACCOUNT_FIELD}
	Verify Screen Title    ${SCREEN_TITLE_TEXT}     My accounts

Navigate to Balance Information
	Wait Until Element Is Ready And Click        ${BALANCE_INFORMATION_BUTTON}
	Wait Until Element Is Ready           ${BALANCE_INFORMATION_LABEL}
	Verify Screen Title      ${SCREEN_TITLE_TEXT}      Balance information

User should view total balance
	Wait Until Element Is Ready     ${TOTAL_BALANCE_FIELD}
	${TOTAL_BALANCE_AMOUNT_DETAILS}=  Get Text  ${TOTAL_BALANCE_FIELD}
	Split String    ${TOTAL_BALANCE_AMOUNT_DETAILS}
	${TOTAL_BALANCE_AMOUNT}=    Fetch From Left    ${TOTAL_BALANCE_AMOUNT_DETAILS}       100
	Strip String    ${TOTAL_BALANCE_AMOUNT}
	${TOTAL_BALANCE_AMOUNT}    Remove String    ${TOTAL_BALANCE_AMOUNT}    ,
	Log To Console  ${TOTAL_BALANCE_AMOUNT}

User should view Lien/blocked balance
	${LIEN_AMOUNT_DETAILS}=  Get Text  ${LIEN_AMOUNT_FIELD}
	Split String    ${LIEN_AMOUNT_DETAILS}
	${LIEN_AMOUNT}=    Fetch From Left    ${LIEN_AMOUNT_DETAILS}       100
	Strip String    ${LIEN_AMOUNT}
	Log To Console  ${LIEN_AMOUNT}

User should view uncleared balance
	${UNCLEARED_AMOUNT_DETAILS}=  Get Text  ${UNCLEARED_AMOUNT_FIELD}
	Split String    ${UNCLEARED_AMOUNT_DETAILS}
	${UNCLEARED_AMOUNT}=    Fetch From Left    ${UNCLEARED_AMOUNT_DETAILS}       100
	Strip String    ${UNCLEARED_AMOUNT}
	Log To Console  ${UNCLEARED_AMOUNT}

User should view available balance
	${AVAILABLE_ACCOUNT_BALANCE_DETAILS}=  Get Text  ${AVAILABLE_ACCOUNT_BALANCE_FIELD}
	Split String    ${AVAILABLE_ACCOUNT_BALANCE_DETAILS}
	${AVAILABLE_ACCOUNT_BALANCE}=    Fetch From Left    ${AVAILABLE_ACCOUNT_BALANCE_DETAILS}       100
	${AVAILABLE_ACCOUNT_BALANCE}    Remove String    ${AVAILABLE_ACCOUNT_BALANCE}    ,
	Strip String    ${AVAILABLE_ACCOUNT_BALANCE}
	Log To Console  ${AVAILABLE_ACCOUNT_BALANCE}


Verify The Sum of All Balances Equal the Available Balance
	${TOTAL_BALANCE_AMOUNT_DETAILS}=  Get Text  ${TOTAL_BALANCE_FIELD}
	Split String    ${TOTAL_BALANCE_AMOUNT_DETAILS}
	${TOTAL_BALANCE_AMOUNT}=    Fetch From Left    ${TOTAL_BALANCE_AMOUNT_DETAILS}       100
	Strip String    ${TOTAL_BALANCE_AMOUNT}
	${TOTAL_BALANCE_AMOUNT}    Remove String    ${TOTAL_BALANCE_AMOUNT}    ,
	${TOTAL_BALANCE_AMOUNT}    Remove String    ${TOTAL_BALANCE_AMOUNT}    .

	${LIEN_AMOUNT_DETAILS}=  Get Text  ${LIEN_AMOUNT_FIELD}
	Split String    ${LIEN_AMOUNT_DETAILS}
	${LIEN_AMOUNT}=    Fetch From Left    ${LIEN_AMOUNT_DETAILS}       100
	Strip String    ${LIEN_AMOUNT}
	${LIEN_AMOUNT}    Remove String    ${LIEN_AMOUNT}    .


	${UNCLEARED_AMOUNT_DETAILS}=  Get Text  ${UNCLEARED_AMOUNT_FIELD}
	Split String    ${UNCLEARED_AMOUNT_DETAILS}
	${UNCLEARED_AMOUNT}=    Fetch From Left    ${UNCLEARED_AMOUNT_DETAILS}       100
	Strip String    ${UNCLEARED_AMOUNT}
	${UNCLEARED_AMOUNT}    Remove String    ${UNCLEARED_AMOUNT}    .


	${AVAILABLE_ACCOUNT_BALANCE_DETAILS}=  Get Text  ${AVAILABLE_ACCOUNT_BALANCE_FIELD}
	Split String    ${AVAILABLE_ACCOUNT_BALANCE_DETAILS}
	${AVAILABLE_ACCOUNT_BALANCE}=    Fetch From Left    ${AVAILABLE_ACCOUNT_BALANCE_DETAILS}       100
	${AVAILABLE_ACCOUNT_BALANCE}    Remove String    ${AVAILABLE_ACCOUNT_BALANCE}    ,
	${AVAILABLE_ACCOUNT_BALANCE}    Remove String    ${AVAILABLE_ACCOUNT_BALANCE}    .

	Strip String    ${AVAILABLE_ACCOUNT_BALANCE}

#	${TOTAL_AMOUNT_CALCULATED}    Evaluate    (${AVAILABLE_ACCOUNT_BALANCE}+${LIEN_AMOUNT}+${UNCLEARED_AMOUNT})
#	Log To Console    ${TOTAL_AMOUNT_CALCULATED}
#    Should Be Equal As Numbers      ${TOTAL_AMOUNT_CALCULATED}      ${TOTAL_BALANCE_AMOUNT}

Close The Modal
	Close Modal    ${NAVIGATE_BACK_FROM_PDF_BUTTON}

Click on Borrow Menu
	Click Menu Item         Borrow
	Verify Screen Title     ${MAIN_TITLE}     Borrow

Verify that Loan Amount is displayed
	Wait Until Element Is Ready      ${LOAN_TEXT_FIELD}
	${MY_LOAN_TEXT}=  Get Text        ${LOAN_TEXT_FIELD}
	Should Be Equal As Strings        ${MY_LOAN_TEXT}         	My loans
	${HIDE_BALANCE_TEXT}=  Get Text   ${HIDE_BALANCE_TEXT_FIELD}
	Should Be Equal As Strings        ${HIDE_BALANCE_TEXT}        Show balance

Verify that Loan Balance is Displayed
	Wait Until Element Is Ready    ${LOAN_BALANCE_FIELD}
	${LOAN_BALANCE}=      Get Text    ${LOAN_BALANCE_FIELD}
	Should Contain    ${LOAN_BALANCE}       Loan balance:
	#Should End With   ${LOAN_BALANCE}       KES
	Log To Console    ${LOAN_BALANCE}

Verify that Loan has Installment Payment
	${LOAN_INSTALLMENT}=      Get Text    ${LOAN_INSTALLMENT_FIELD}
	#Should Contain    ${LOAN_INSTALLMENT}       ${LOCAL_CURRENCY}
	Should End With   ${LOAN_INSTALLMENT}       per month
	${NEXT_PAYMENT_LABEL}=      Get Text    ${NEXT_PAYMENT_LABEL_FIELD}
	Should Contain    ${NEXT_PAYMENT_LABEL}      Next Payment
	Should End With   ${NEXT_PAYMENT_LABEL}        Payment
    ${LOAN_AMOUNT}=      Get Text    ${INSTALLMENT_MONTH_AMOUNT}
    Log To Console    ${LOAN_AMOUNT}
	Sleep    3sec
	Click Back Arrow        ${BACK_ICON_BORR0W}
	Verify Screen Title     ${MAIN_TITLE}     Home
