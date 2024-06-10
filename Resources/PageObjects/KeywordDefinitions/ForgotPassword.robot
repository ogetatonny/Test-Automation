*** Settings ***
Library  AppiumLibrary
Resource    ../KeywordDefinitions/LoginPage.robot
Resource    ../KeywordDefinitions/CommonFunctions.robot
Variables    ../Locators/ForgotPasswordScreen.py

*** Keywords ***
Navigate to Forgot Password Page
	Device Access Permission
    Choose Preferred Language
    Click On The Next Button/Get Started
    Click on SignIn Button
    Click on Forgot Yout Password Link

Click on Forgot Yout Password Link
	Wait Until Element Is Ready           ${FORGOT_PASSWORD_LINK}
	Click Element    ${FORGOT_PASSWORD_LINK}
   Wait Until Element Is Ready           ${ANCHOR_FORGOT_PASSWORD_SCREEN}
	${SCREEN-TITLE}=  Get Text             ${ANCHOR_FORGOT_PASSWORD_SCREEN}
	Should Be Equal As Strings              ${SCREEN-TITLE}                        How would you like to get verified?

Complete the information to Reset your password
	Choose Your Country
	Input Account Number
	Input ID Number
	Click Continue

Choose Your Country
	Click Element    ${SELECT_A_COUNTRY_FIELD}
	Wait Until Element Is Ready          ${SCREEN_TITLE}
	Select Country      Kenya

Input Account Number
	Input Text    ${ACCOUNT_NUMBER_TEXTFIELD}       ${KE_ACCOUNT_NUMBER}

Input ID Number
	Input Text    ${ID_NUMBER_TEXTFIELD}            ${KE_ID_NUMBER}

Click Continue
	Click Element    ${CONTINUE_BUTTON}

Enter New Password
	[Arguments]    ${NEW_PASSWORD}
	Wait Until Element Is Ready           ${ENTER_PASSWORD_FIELD}
	Input Text          ${ENTER_PASSWORD_FIELD}        ${NEW_PASSWORD}

Re-Enter the Password
	[Arguments]    ${CONFIRM_NEW_PASSWORD}
	Input Text          ${RE_ENTER_PASSWORD_FIELD}         ${CONFIRM_NEW_PASSWORD}

Confirm Password Changes
	Click Element    ${CONFIRM_BUTTON}
	Lets Try Again


Select Security Challenge as verification option
	Wait Until Element Is Ready           ${VERIFICATION_BY_SECURITY_CHALLENGE}
	Click Element    ${VERIFICATION_BY_SECURITY_CHALLENGE}
	Click Element    ${CONFIRM_BUTTON}

Verification Via SMS
	Wait Until Element Is Ready          ${VERIFICATION_BY_SMS}
	Click Element    ${VERIFICATION_BY_SMS}
	Click Element    ${CONFIRM_BUTTON}

Lets Try Again
    [Documentation]     Click Try Again Button popup if exists. No action if there is no popup
    ${PRESENCE_OF_POPUP}=    Run Keyword And Return Status    Element Should Be Visible    ${TRY_AGAIN_BUTTON_ON_MODAL}
    IF    ${PRESENCE_OF_POPUP}    Click Element    ${TRY_AGAIN_BUTTON_ON_MODAL}
