*** Settings ***
Library    AppiumLibrary
Library    String
Variables    ../Locators/WithdrawCashScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot
Resource    ../KeywordDefinitions/SendMoney.robot

*** Keywords ***
Click On Agent Menu
	Scroll Down the App
	Click Transaction Items     Agent
	Verify Screen Title            ${SCREEN_TITLE_FIELD}       Withdraw from agent

Click on Withdraw At
	Wait Until Element Is Ready And Click        ${WITHDRAW_AT_FIELD}

Enter Agent Number
	[Arguments]     ${AGENT_NUMBER}
	Verify Screen Title             ${SCREEN_TITLE_FIELD}       Withdraw at
    Input Text     ${AGENT_NUMBER_TEXTFIELD}      ${AGENT_NUMBER}

Click on Continue to Add Agent
	Wait Until Element Is Ready And Click    ${CONTINUE_TO_ADD_AGENT}
	Sleep    5 sec

Enter Amount to Withdraw
	[Arguments]    ${WITHDRAW_TO_AMOUNT}
	Input Text    ${WITHDRAW_AMOUNT_FIELD}       ${WITHDRAW_TO_AMOUNT}

Click Continue to Withdraw
	Wait Until Element Is Ready And Click    ${CONTINUE_WITHDRAW_BUTTON}

Review And Confirm
	Verify Screen Title     ${SCREEN_TITLE_TEXT}            Review
	Verify Screen Title     ${TRANSACTION_TYPE_FIELD}       Withdraw from agent

Click on the Withdraw Cash Button
	Wait Until Element Is Ready And Click    ${WITHDRAW_CASH_BUTTON}


Withdraw Cash From An Agent
	[Arguments]    ${AGENT_NUMBER}
	${random_number}    Evaluate    random.randint(${user_subsidiary["AgentMin"]}, ${user_subsidiary["AgentMax"]})
	Click on Withdraw At
	Enter Agent Number      ${AGENT_NUMBER}
	Click on Continue to Add Agent
	Enter Amount to Withdraw     ${random_number}
	Click Continue to Withdraw
	Review And Confirm
	Charge Fee Verification         ${user_subsidiary["AGENT_NUMBER_Charge_fee"]}
	Click on the Withdraw Cash Button
	Transaction Verification
	Verify that the Agent Withdrawal transaction is Successful
	Click on Done Button