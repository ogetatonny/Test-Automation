*** Settings ***
Library    AppiumLibrary
Library    String
Variables    ../Locators/HomeScreen.py
Variables    ../Locators/AccountMenuScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot


*** Variables ***
${ACCOUNT_NUMBER_TEXT_DETAILS}
${first_acc_number}
&{ADD_ACCOUNT_MESSAGE}   message=Your account has been successfully added to your profile


*** Keywords ***
Get the customer's account number
        Wait Until Element Is Ready    ${ACCOUNT_NUMBER_TEXT}
        ${ACCOUNT_NUMBER_TEXT_DETAILS}=       Get Text    ${ACCOUNT_NUMBER_TEXT}
        Split String    ${ACCOUNT_NUMBER_TEXT_DETAILS}
        ${ACC_NUMBER}=      Fetch From Left    ${ACCOUNT_NUMBER_TEXT_DETAILS}      •
        Strip String    ${ACC_NUMBER}
        Log    ${ACC_NUMBER}

Remove the customer's account number
	    Wait Until Element Is Ready      ${ACCOUNT_ACTION_LINK}
	    Wait Until Element Is Ready And Click           ${ACCOUNT_ACTION_LINK}
        Wait Until Element Is Ready    ${ACCOUNT_UNLINK_LINK}
        Wait Until Element Is Ready And Click           ${ACCOUNT_UNLINK_LINK}
        Wait Until Element Is Ready And Click           ${ACCOUNT_UNLINK_CONFIRMATION}
        Wait Until Element Is Ready    ${CLOSE_ACCOUNT_UNLINK_CONFIRMATION}
        Click Element    ${CLOSE_ACCOUNT_UNLINK_CONFIRMATION}

Navigate to existing accounts
	Wait Until Element Is Ready     ${ACCOUNTS_MENU_TAB}
    Click Element    ${ACCOUNTS_MENU_TAB}
    Wait Until Element Is Ready    ${ADD_EXISTING_ACCOUNT_LINK}
    Click Element    ${ADD_EXISTING_ACCOUNT_LINK}
    Wait Until Element Is Ready And Click              ${ADD_AN_EQUITY_ACCOUNT_LINK}

# Choose delinked account to add back to profile

Add select account and add to profile
	Wait Until Element Is Ready     ${ADD_ACCOUNT_CHECKBOX}
    Click Element    ${ADD_ACCOUNT_CHECKBOX}
    Wait Until Element Is Ready And Click       ${ADD_ACCOUNT_BUTTON}


Verify that Account is Successfully Added
    Wait Until Element Is Ready           ${ADD_ACCOUNT_DONE_BUTTON}
	${CONFIRMATION-TEXT}=  Get Text         ${ADD_ACCOUNT_SUCCESS_MESSAGE}
	Should Be Equal As Strings              ${CONFIRMATION-TEXT}                         ${ADD_ACCOUNT_MESSAGE}[message]
	Click Element                           ${ADD_ACCOUNT_DONE_BUTTON}
	Sleep    5s
	Verify Screen Title    ${MAIN_TITLE}        Home


