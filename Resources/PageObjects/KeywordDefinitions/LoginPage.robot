*** Settings ***
Library     AppiumLibrary
Variables    ../Locators/GetStartedScreen.py
Variables    ../Locators/LoginScreen.py
Variables    ../Locators/VerificationScreen.py
Variables    ../Locators/RemoveOtherDevicesOnLogin.py
Variables    ../Locators/OnboardingScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot
Variables    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE/TestData/TestData.py


*** Keywords ***
User Login With Valid Credential
	[Documentation]    Login with valid password
	Wait Until Element Is Visible    ${EMAIL_MOBILE_NUMBER_FIELD}   10s
    Input Text        ${EMAIL_MOBILE_NUMBER_FIELD}        ${current_user["user_name"]}
    #${INITIATORS-DETAILS}[email]
    Input Text        ${PASSWORD_FIELD}                   ${current_user["password"]}
    #${INITIATORS-DETAILS}[password]
    Click Element     ${LOGIN_BUTTON}

Subsequent Login with Valid Password
	Wait Until Element Is Visible    ${PASSWORD_FIELD}
	Input Text                       ${PASSWORD_FIELD}                   ${INITIATORS-DETAILS}[password]
	Wait Until Element Is Ready And Click        ${LET_ME_IN}

Device Access Permission
	Click Element    ${ALLOW_DEVICE_ACCESS_WHILE_USING_THE_APP}
	sleep  5s

Navigate to Login Page
	Device Access Permission
    Choose Preferred Language
    sleep    5s
    Choose Proceed upon OS verification warning
    Click On The Next Button/Get Started
    Click on SignIn Button

Select your language
	Wait Until Element Is Ready And Click      ${CHOOSE_LANGUAGE}

Click on Continue Button
	Wait Until Element Is Ready And Click      ${CONTINUE_BUTTON}

Choose Preferred Language
	Select your language
	Click on Continue Button

Choose Proceed upon OS verification warning
    ${OS_Validation}        Run Keyword And Return Status        Page Should Not Contain Element      ${PROCEED_BUTTON}
    Run Keyword If    ${OS_Validation}== True         Wait Until Element Is Ready and Click    ${PROCEED_BUTTON}

Click On The Next Button/Get Started
    #Verify Screen Title
	#Verify Screen Title    ${SLIDER_TITLE}     More than just banking
	Wait Until Page Contains Element    ${NEXT_BUTTON}
	Click Element                   ${NEXT_BUTTON}
	Click Element                   ${NEXT_BUTTON}
	Click Element                   ${NEXT_BUTTON}
	Click Element                   ${GET_STARTED_BUTTON}


Click on Register Button
	Wait Until Element Is Visible   ${REGISTER_IN_BUTTON}
	Click Element                   ${REGISTER_IN_BUTTON}

Click on SignIn Button
	Wait Until Element Is Ready     ${SIGN_IN_BUTTON}
	Click Element                   ${SIGN_IN_BUTTON}

Signin With Initiator
	[Arguments]    ${EMAIL-OR-MOBILE-NUMBER}        ${USER-PASSWORD}
	Wait Until Element Is Ready                     ${EMAIL-OR-MOBILE-NUMBER}
	Input Email address or Mobile Number            ${EMAIL-OR-MOBILE-NUMBER}
	Input User Password                             ${USER-PASSWORD}
	Click on Login Button

Input Email address or Mobile Number
	[Arguments]                          ${EMAIL-OR-MOBILE-NUMBER}
    Wait Until Page Contains Element     ${EMAIL_MOBILE_NUMBER_FIELD}
    Input Text                           ${EMAIL_MOBILE_NUMBER_FIELD}               ${EMAIL-OR-MOBILE-NUMBER}

Input Email address/Mobile Number
	Input Email address or Mobile Number        ${current_user["user_name"]}

Input Invalid User Password
	Input User Password     ${current_user["invalid_password"]}

Input User Password
    [Arguments]                          ${USER-PASSWORD}
    Wait Until Page Contains Element     ${PASSWORD_FIELD}
    Input Text                           ${PASSWORD_FIELD}                          ${USER-PASSWORD}

Click on Login Button
	Wait Until Element Is Ready And Click      ${LOGIN_BUTTON}
	sleep    10s

Key in OTP and Verify
	Verification My SMS and Click Confirm Button
	Input Verification Code

Verification My SMS and Click Confirm Button
	Wait Until Element Is Ready          ${ANCHOR_VERIFY_SCREEN}
	sleep    10s
	Wait Until Element Is Visible        ${SMS_VERIFICATION_FIELD}
    Click Element                        ${SMS_VERIFICATION_FIELD}
	Wait Until Element Is Visible        ${CONFIRM_BUTTON}
	Click Element                        ${CONFIRM_BUTTON}

Input Verification Code
	Wait Until Element Is Ready          ${VERIFICATION_CODE_1}
	Input Text                           ${VERIFICATION_CODE_1}                     1
	Input Text                           ${VERIFICATION_CODE_2}                     2
	Input Text                           ${VERIFICATION_CODE_3}                     3
	Input Text                           ${VERIFICATION_CODE_4}                     4
	Input Text                           ${VERIFICATION_CODE_5}                     5
	Input Text                           ${VERIFICATION_CODE_6}                     6

Select and Confirm an Option to Verify Security Question
	Wait Until Element Is Ready          ${VERIFICATION_BY_SECURITY_QUESTION}
    Click Element                        ${VERIFICATION_BY_SECURITY_QUESTION}
    Wait Until Element Is Visible        ${CONFIRM_BUTTON}
	Click Element                        ${CONFIRM_BUTTON}

Input Security Answer For First Question
	Sleep    5sec
	Verify Screen Title    ${SCREEN_TITLE_TEXT}     Security questions
    Wait Until Element Is Ready And Click      ${FIRST_SECURITY_QUESTION_FIELD}
	Input Text Into Current Element            ${SECURITY-ANSWER1}[answer]

Input Security Answer For Second Question
	Wait Until Element Is Ready And Click      ${SECOND_SECURITY_QUESTION_FIELD}
	Input Text Into Current Element            ${SECURITY-ANSWER2}[answer]

Click on Confirm Security Question Button
#	Wait Until Element Is Ready And Click      ${FIRST_SECURITY_QUESTION}
#    Wait Until Element Is Ready And Click      ${BTN_CLOSE_MODAL}
	Wait Until Element Is Ready And Click      ${CONFIRM_SEC_QUE_BUTTON}

Bypassing the Quick Share on android 15
    sleep  5s
    ${Quick_Share_Validation}        Run Keyword And Return Status        Page Should Not Contain Element     ${QUICK_SHARE}
    Run Keyword If    not ${Quick_Share_Validation}      Bypassing security question if on quick share


Bypassing security question if on quick share
    Wait Until Element Is Ready And Click    ${QUICK_SHARE_BACK_ARROW}
    Click on Confirm Security Question Button
    sleep   10s


Answer first security question
	#Verify Screen Title    ${SCREEN_TITLE_TEXT}     Security questions
    #Click Element    ${FIRST_SECURITY_QUESTION}
   # Wait Until Element Is Ready       Please select a security question
    Wait Until Page Contains Element     ${FIRST_SECURITY_QUESTION}   20s
    ${FIRST_SELECTED_QUESTION_TEXT}=    Get Text    ${FIRST_SECURITY_QUESTION}
    Log    FIRST_SELECTED_QUESTION_TEXT
    IF    '${FIRST_SELECTED_QUESTION_TEXT}' == '${current_user["first_question"]}'
    	Wait Until Element Is Ready And Click   ${FIRST_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["first_answer"]}
    ELSE IF    '${FIRST_SELECTED_QUESTION_TEXT}' == '${current_user["second_question"]}'
        Wait Until Element Is Ready And Click   ${FIRST_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["second_answer"]}
    ELSE IF    '${FIRST_SELECTED_QUESTION_TEXT}' == '${current_user["third_question"]}'
        Wait Until Element Is Ready And Click   ${FIRST_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["third_answer"]}
    ELSE IF    '${FIRST_SELECTED_QUESTION_TEXT}' == '${current_user["fourth_question"]}'
       	Wait Until Element Is Ready And Click   ${FIRST_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["fourth_answer"]}
    ELSE
       	Wait Until Element Is Ready And Click   ${FIRST_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["fifth_answer"]}
    END
    Hide Keyboard


Answer second security question

	#Click Element    ${SECOND_SECURITY_QUESTION}
    #Wait Until Element Is Ready       Please select a security question
    ${SECOND_SELECTED_QUESTION_TEXT}=    Get Text    ${SECOND_SECURITY_QUESTION}
    IF    '${SECOND_SELECTED_QUESTION_TEXT}' == '${current_user["first_question"]}'
        Wait Until Element Is Ready And Click   ${SECOND_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["first_answer"]}
    ELSE IF    '${SECOND_SELECTED_QUESTION_TEXT}' == '${current_user["second_question"]}'
        Wait Until Element Is Ready And Click   ${SECOND_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["second_answer"]}
    ELSE IF    '${SECOND_SELECTED_QUESTION_TEXT}' == '${current_user["third_question"]}'
        Wait Until Element Is Ready And Click   ${SECOND_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["third_answer"]}
    ELSE IF    '${SECOND_SELECTED_QUESTION_TEXT}' == '${current_user["fourth_question"]}'
        Wait Until Element Is Ready And Click   ${SECOND_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["fourth_answer"]}
    ELSE
        Wait Until Element Is Ready And Click   ${SECOND_SECURITY_QUESTION_FIELD}
	    Input Text Into Current Element         ${current_user["fifth_answer"]}
    END


Click on the Show Me Later Button
    sleep    10s
    ${presence_of_popup}=    Run Keyword And Return Status   page should contain element    ${SHOW_ME_LATER_BUTTON}
    Run Keyword If       ${presence_of_popup}    Click Element    ${SHOW_ME_LATER_BUTTON}

Click Show Me Later Button On the whats new PopUp
	[Documentation]    Click Show me Later button popup if exists. No action if there is no popup
    ${presence_of_popup}=    Run Keyword And Return Status    Page Should Contain Element     ${SHOW_ME_LATER_BUTTON}
    IF    '${presence_of_popup}' == 'True'
    	Click Element    ${SHOW_ME_LATER_BUTTON}
    END

Close Whats New Popup if available
    [Documentation]    Closes popup if exists. No action if there is no popup
    ${PRESENCE_OF_POPUP}=    Run Keyword And Return Status    Element Should Be Visible    ${CLOSE_WHATS_NEW_BUTTON}
    IF    '${PRESENCE_OF_POPUP}' == 'True'
    	Click Element    ${CLOSE_WHATS_NEW_BUTTON}
    END

Lets Go! Whats New Popup
    [Documentation]     Click Lets Go Button popup if exists. No action if there is no popup
    ${PRESENCE_OF_POPUP}=    Run Keyword And Return Status    Element Should Be Visible    ${LETS_GO_BUTTON}
    Run Keyword If     ${PRESENCE_OF_POPUP}    Click Element    ${LETS_GO_BUTTON}

Remove Existing Devices
	[Documentation]    Remove existing Devices
    ${NEW_DEVICE_VISIBILITY}=    Run Keyword And Return Status   Wait Until Element Is Ready     ${NEW_DEVICE_REMOVE_POPUP}
    IF    '${NEW_DEVICE_VISIBILITY}' == 'True'
    	${NEW_DEVICE_REMOVE_POPUP_LABEL}=   Get Text    ${NEW_DEVICE_REMOVE_POPUP}
    	sleep    5s
        ${USED_DEVICES}=        Get WebElements    ${OLD_EXISTING_DEVICES}
        FOR    ${USED_DEVICE}    IN    @{USED_DEVICES}
            Click Element    ${USED_DEVICE}
        END
        Click Element    ${REMOVE_DEVICE_BUTTON}
    END


Verify that Signed in Devices is Displayed
    Wait Until Element Is Ready             ${SIGNED_IN_DEVICES}
	${SIGNEDIN-TEXT}=  Get Text             ${SIGNED_IN_DEVICES}
	Should Be Equal As Strings              ${SIGNEDIN-TEXT}                         ${SIGNED_IN_DEVICE_MESSAGE}[message]

Validate Customer Accounts are available
    Wait Until Element Is Ready and Click     ${ACCOUNTS_MENU_TAB}
	Wait Until Element Is Ready               ${VIEW_ALL_ACCOUNTS_BUTTON}
	Wait Until Element Is Ready And Click     ${EQUITY_HOME_TAB}
	Wait Until Page Contains Element           ${MAIN_TITLE}

Check To See If The Error Message Is Visible
	Wait Until Element Is Visible    ${TRY_AGAIN_BUTTON}
	${ERROR_TITLE}=  Get Text            ${LOGIN_ERROR_TITLE}
	Should Be Equal As Strings    ${ERROR_TITLE}        Uh oh!
	${ERROR_DESCRIPTION}=  Get Text            ${ERROR_DESCRIPTION}
	Should Be Equal As Strings    ${ERROR_DESCRIPTION}        Sorry, these details aren't familiar to us, please take a look and try again
    Click Element    ${TRY_AGAIN_BUTTON}

Validate Page Title
    Wait Until Page Contains Element        ${MAIN_TITLE}  60s
	#Verify Screen Title      ${MAIN_TITLE}         #Home


I login with username "${username}" and password "${password}"
    Log To Console    I login with username ${current_user["user_name"]} and password ${current_user["password"]}
    IF   "${username}" == ${current_user["user_name"]} and "${password}" == ${current_user["password"]}
        Log To Console    Login successfully
        Set Test Variable    ${login_status}    True
    ELSE
        Log To Console    Login failed
        Set Test Variable    ${login_status}    False
    END

I should see the welcome page
    Log To Console    I should see the welcome page
    IF   "${login_status}" == "True"
        Log To Console    Welcome page is displayed
    ELSE
        Log To Console    Welcome page is not displayed
        Fail    Welcome page is not displayed
    END

I should see the error message
    Log To Console    I should see the error message
    IF   "${login_status}" == "False"
        Log To Console    Error message is displayed
    ELSE
        Log To Console    Error message is not displayed
        Fail    Error message is not displayed
    END