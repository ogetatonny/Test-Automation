*** Settings ***
Library    AppiumLibrary
Variables    ../Locators/HomeScreen.py


*** Keywords ***
Logout From the App
	Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${LOG_OUT_START_ICON}
	Click Element    ${LOG_OUT_START_ICON}
	Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible      ${SIGN_OUT_BUTTON}
	Click Element    ${SIGN_OUT_BUTTON}
	Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible      ${CONFIRM_SIGN_OUT_BUTTON}
	Click Element    ${CONFIRM_SIGN_OUT_BUTTON}

