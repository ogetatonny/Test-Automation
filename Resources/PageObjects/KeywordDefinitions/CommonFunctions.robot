*** Settings ***
Library    String
Library    AppiumLibrary
Library         OperatingSystem
Variables    ../Locators/GetStartedScreen.py
Variables    ../Locators/HomeScreen.py
Variables    ../Locators/AccountMenuScreen.py
Variables    ../Locators/TransactMenuScreen.py
Resource     ../KeywordDefinitions/LoginPage.robot
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    LoginPage.robot

*** Variables ***
${remoteUrl1}=                   http://0.0.0.0:4723
${remoteUrl2}=                   http://0.0.0.0:4725
${ANDROID_AUTOMATION_NAME}=     UiAutomator2
${ANDROID_APP_PACKAGE}=         ke.co.equitygroup.equitymobile.debug
${ANDROID_APP_ACTIVITY}=        ke.co.equitybank.oneequity.MainActivity
${ANDROID_APP_SUB_ACTIVITY}=    com.google.android.gms.auth.api.signin.RevocationBoundService
${ANDROID_PLATFORM_NAME}=       Android
${ANDROID_PLATFORM_VERSION}=    15
#${DEVICE_NAME}=                 emulator-5554
${DEVICE_NAME1}=                 emulator-5554
${DEVICE_NAME2}=                 emulator-5556
${app}=    ${EXECDIR}${/}Resources/AppFile/app (5).apk
@{document}=    ${EXECDIR}${/}Resources/Documents/Document1.pdf
#@{dir}=    /Users/asd/PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE
@{dir}=     ${EXECDIR}${/}PycharmProjects/ROBOT_ANDROID_EQUITY_MOBILE
${global_timeout}=  60
${retry}=  40x
${retry_interval}=  1s
${suite_setup_status}=    none
${login_status}=    none
${ENTER_PIN}=   Please enter your PIN to continue
${OTP_MESSAGE}=   verification code
${TRY_AGAIN_WORD}=  Try again


#*** Test Variables ***
&{INITIATORS-DETAILS}        email=john.mimera1055@equitybank.com    password=Manual@2024
&{APPROVALS-DETAILS}         email=CA213UGMANDATE2@GMAIL.COM         password=Test@1234
&{SECURITY-ANSWER1}          answer=1
&{SECURITY-ANSWER2}          answer=1
&{SIGNED_IN_DEVICE_MESSAGE}  message=To add this as a new device, please remove one of your signed in devices

# email=CA213UGMADATE1@GMAIL.COM      password=1234@Test
# email=john.mimera1055@equitybank.com      password=Manual@2024

${LOCAL_CURRENCY} =     KES
${KE_ACCOUNT_NUMBER} =     1003100262793
${KE_ID_NUMBER} =      CM8603010260GA
${KE_CIF} =     56010045886

@{DESTINATION_COUNTRY}      Congo (Democratic Republic of the)   Kenya    Rwanda   South Sudan   Uganda     Tanzania, United Republic of

@{MENU_ITEMS}    Transact    Borrow   Save

@{FEATURE_ITEMS}    Equity account    Mobile money   Another bank

@{ACCOUNT_INFO_MENU}        Transact    Account information     View statement  Balance information

${NEW_DEVICE_REMOVE_POPUP_TEXT} =       New device sign-in

${PIN}      2024
${NEW_PASSWORD}=    1234@Test
${CONFIRM_NEW_PASSWORD}=    1234@Test

@{TRANSACTION_ITEMS}    Own Equity account    Another Equity account    Pay to card
...    Mobile money    Another Bank    Pay a bill    Buy goods    Buy airtime
...    ATM    Agent    PayPal    Western Union

@{WESTERN_UNION_TRANSACTION_TYPES}      Send money        Receive money
@{WESTERN_UNION_DELIVERY_METHOD}      MONEY IN MINUTES        DIRECT TO BANK        MOBILE MONEY TRANSFER

@{TELCO}    Safaricom    Airtel    Equitel    Telkom
@{PHONE_NUMBER}    720000000    733000000    763000000    775000000     721000000    776257986
...    765555078       778000000
@{MOBILEMONEY_TELCOS}    Airtel Money    M-PESA    T Kash
@{PESALINK}    Another bank account    Phone-linked account

@{SCHEDULE_PAYMENT_TRANSACTION_FILTER}    All     Equity account     Another bank    Swift
...     Mobile money    Pay bill     Airtime

@{SCHEDULE_PAYMENT_TRANSACTION_TYPE}    Send to an Equity account    Send to another bank     Send mobile money
...     	Pay a bill    Buy airtime

@{TRANSACTION_FREQUENCY}    One Off   Daily     Weekly    Bi Weekly    Monthly
...     Quarterly     Half Yearly     Yearly

@{REMIND_ME}        1 day before payment   2 days before payment    3 days before payment    1 week before payment
...     5 days before payment     Don't remind me

@{ANOTHER_EQUITY_ACCOUNT}       0020162480467
@{ANOTHER_BANK_ACCOUNT}         01097580008       441001127434      2010348059
@{BANK_NAME}        BOA     NCBA
@{PESALINK_NUMBER}      728107303
@{AGENT_NUMBER}         050031
@{ZUKU_Biller_Code}    320320     101704
@{KPLC_Biller_Code}    6800001    1040963

@{SWIFT_COUNTRY}        ITALY
@{SWIFT_BANK_CODE}      BRASITMMXXX
@{SWIFT_ACCOUNT}        12012901293829
@{TRANSACTION_CURRENCY}   United states dollar

${TILL_NUMBER}     0766555004
@{UG_EQUITY_ACCOUNT}     1013140266025      1005100893550
@{RW_EQUITY_ACCOUNT}     4001111528210      4005111281267
@{TZ_EQUITY_ACCOUNT}     3001100004415      3004111132042
@{SS_EQUITY_ACCOUNT}     2001111300232      2001111306713


*** Keywords ***

*** Keywords ***
Open Equity Mobile Application
    [Arguments]    ${remote_url}    ${adb_port}    ${system_port}    ${udid}
    Open Application    ${remote_url}
    ...  automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}
    ...  platformVersion=${ANDROID_PLATFORM_VERSION}
    ...  app=${app}
    ...  appPackage=${ANDROID_APP_PACKAGE}
    ...  appActivity=${ANDROID_APP_ACTIVITY}
    ...  ensureWebviewsHavePages=${True}
    ...  nativeWebScreenshot=${True}
    ...  newCommandTimeout=30000
    ...  launchTimeout=48000
    ...  connectHardwareKeyboard=${True}
    ...  deviceOrientation=portrait
    ...  noReset=${False}
    ...  appium:adbPort=${adb_port}
    ...  appium:systemPort=${system_port}
    ...  appium:udid=${udid}

Open Equity Mobile Application on device 1
    Open Equity Mobile Application    ${remoteUrl1}   5037    8201    emulator-5554


Open Equity Mobile Application on device 2
    Open Equity Mobile Application    ${remoteUrl2}   5038    8202    emulator-5556


Scroll Down to Security Answer
	Sleep    2sec
	Swipe    333    999    577    384

Scroll Down the App
	Sleep    3sec
	Swipe    784    2260    812    120
	#Swipe    758    2176    715    597

Scroll Right the App
	Sleep    5sec
	Swipe    998    503    86    503

Scroll into the View
	Swipe    986    1971    977    788
Wait Until Element Is Ready
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds      ${retry}      ${retry_interval}     Element Should Be Visible     ${locator}

Wait Until Element Is Ready and Click
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds      ${retry}      ${retry_interval}     Click Element        ${locator}

Search and Select a Country
	[Arguments]      ${DESTINATION_COUNTRY}
	#Wait Until Element Is Ready And Click    ${SEARCH_FOR_A_BENEFICIARY}
	Input Text    ${SEARCH_FOR_A_BENEFICIARY}       ${DESTINATION_COUNTRY}
	Wait Until Element Is Ready And Click    ${SEARCH_RESULT_COUNTRY_LIST}

Select Country
    [Documentation]   click the preferred country
    [Arguments]      ${DESTINATION_COUNTRY}
    Wait Until Element Is Ready And Click    //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${DESTINATION_COUNTRY}']
    #//android.widget.TextView[@text='${COUNTRY_LIST}']

Click Account Menu Item
    [Documentation]    click the Account Menu Item
    [Arguments]      ${ACCOUNT_INFO_MENU}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/accountInformationMenuItemTitle" and @text='${ACCOUNT_INFO_MENU}']

Click Menu Item
    [Documentation]    click the menu item
    [Arguments]      ${MENU_ITEMS}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${MENU_ITEMS}']

Select a Telco
    [Documentation]    click the menu item
    [Arguments]      ${MOBILEMONEY_TELCOS}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${MOBILEMONEY_TELCOS}']

Own Currency Account
	[Documentation]    Selecting own account based on Local Currency
	[Arguments]    ${LOCAL_CURRENCY}
	Wait Until Element Is Ready And Click    //android.widget.TextView[ends-with(@text,'${LOCAL_CURRENCY}')]

Click SendMoney Feature
    [Documentation]    click the SendMoney Feature item
    [Arguments]       ${FEATURE_ITEMS}
    Click Element    //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/iconSubText" and @text='${FEATURE_ITEMS}']

Click Transaction Items
    [Documentation]    click on transaction items
    [Arguments]    ${TRANSACTION_ITEMS}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${TRANSACTION_ITEMS}']

Click Western Union Transaction Type
    [Documentation]    click on transaction type
    [Arguments]    ${WESTERN_UNION_TRANSACTION_TYPES}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${WESTERN_UNION_TRANSACTION_TYPES}']

Select Delivery Method
    [Documentation]    click on transaction type
    [Arguments]    ${WESTERN_UNION_DELIVERY_METHOD}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${WESTERN_UNION_DELIVERY_METHOD}']

Click Schedule Payment Filter Transaction
    [Documentation]    click on Schedule Payment Filter Transaction
    [Arguments]    ${SCHEDULE_PAYMENT_TRANSACTION_FILTER}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/filterText" and @text='${SCHEDULE_PAYMENT_TRANSACTION_FILTER}']

Click Schedule Payment Transaction Type
    [Documentation]    click on Schedule Payment Transaction Type
    [Arguments]    ${SCHEDULE_PAYMENT_TRANSACTION_TYPE}
    Wait Until Element Is Ready And Click       //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${SCHEDULE_PAYMENT_TRANSACTION_TYPE}']

Select Transaction Frequency
    [Documentation]    Select Frequency
    [Arguments]    ${TRANSACTION_FREQUENCY}
    Wait Until Element Is Ready And Click       //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${TRANSACTION_FREQUENCY}']

Click on Preferred Currency
	[Documentation]    Select Currency
	[Arguments]    ${TRANSACTION_CURRENCY}
	Wait Until Element Is Ready And Click       //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${TRANSACTION_CURRENCY}']

Select Reminder
    [Documentation]    Select Reminder interval
    [Arguments]    ${REMIND_ME}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text='${REMIND_ME}']

Select TELCO
    [Documentation]    click on transaction items
    [Arguments]    ${TELCO}
    Wait Until Element Is Ready And Click        //android.widget.TextView[@text='${TELCO}']

Verify Screen Title
	[Arguments]    ${locator}     ${SCREEN_TITLE}
	sleep    5s
	Wait Until Keyword Succeeds     ${retry}      ${retry_interval}    Element Should Be Visible       ${locator}
	${Field_Text}=  Get Text             ${locator}
	Should Contain                             ${Field_Text}                       ${SCREEN_TITLE}
#    Wait Until Page Contains Element    ${WELCOME_BUTTON}
#    Click Element    ${GET_STARTED_BUTTON}
#    Click Element    ${GET_STARTED_BUTTON}
#    Click Element    ${GET_STARTED_BUTTON}
#    Click Element    ${GET_STARTED_BUTTON}

Validate Results Count
    [Arguments]    ${expected_count}
    ${results}=    Get WebElements    xpath=//div[@id='output-container']
    Length Should Be    ${results}    ${expected_count}

Validate Result Contains Text
    [Arguments]    ${expected_text}
    ${results}=    Get WebElements    xpath=//div[@id='output-container']
    ${match_count}=    Get Length    ${results}[text()="${expected_text}"]
    Should Be Equal As Numbers    ${match_count}    1


Close Modal
	[Arguments]    ${locator}
	Wait Until Keyword Succeeds     ${retry}      ${retry_interval}    Click Element     ${locator}

Click Back Arrow
	[Arguments]    ${locator}
	Wait Until Keyword Succeeds     ${retry}      ${retry_interval}    Click Element     ${locator}

Start Equity Application
	[Documentation]    Validate Equity App Opening and Login is Successful
    Open Equity Mobile Application
    Navigate to Login Page
    User Login With Valid Credential
	Key in OTP and Verify
	Select and Confirm an Option to Verify Security Question
	Answer First Security Question
    Scroll Down to Security Answer
	Answer Second Security Question
	Click on Confirm Security Question Button
	Click on the Show Me Later Button
	Remove Existing Devices
	Sleep    10s
    Click on the Show Me Later Button
    Validate Page Title
	Validate Customer Accounts are available
	${suite_setup_status} =    Set Variable    PASSED
    Set Global Variable    ${suite_setup_status}


Enter Verification Code
	Input Verification Code

Enter Verification PIN
	[Arguments]   ${VERIFICATION_PIN}
	Verify Screen Title     ${PIN_CONFIRMATION_SCREEN_TITLE}        Verify
	Input Text    ${VERIFICATION_PIN_FIELD}     ${VERIFICATION_PIN}
	Wait Until Element Is Ready And Click    ${CONFIRMATION_PIN_BUTTON}

Transaction Verification
#	Verify Screen Title     ${PIN_CONFIRMATION_SCREEN_TITLE}        Verify
	${IS_PIN_VISIBLE}   Run Keyword And Return Status   Wait Until Element Is Visible      ${VERIFICATION_PIN_FIELD}
    ${IS_OTP_VISIBLE}   Run Keyword And Return Status   Wait Until Element Is Visible      ${VERIFICATION_CODE_1}
    Run Keyword If     '${IS_PIN_VISIBLE}' == 'True'     Enter Verification PIN    ${current_user["PIN"]}
    ...    ELSE IF     '${IS_OTP_VISIBLE}' == 'True'     Enter Verification Code
    ...    ELSE        Enter Verification PIN    ${current_user["PIN"]}
    Sleep    7sec

#    Wait Until Element Is Ready    ${DONE_BUTTON}

#  ${PIN_Verification_Message}=  Get Text    ${WU_HEADER_CARD_FIELD}
#  IF    ${PIN_Verification_Message}  == 'Please enter your PIN to continue'
#      Enter Verification PIN    ${current_user["PIN"]}
#  ELSE IF   ${PIN_Verification_Message}  != 'Please enter your PIN to continue'
#      Enter Verification Code
#  ELSE
#      Fail    msg=No Verification Method displayed!
#  END

Click on Done Button
	Wait Until Element Is Ready And Click    ${DONE_BUTTON}

Return Back to Transact Screen
	Click on Done Button
	Verify Screen Title    ${MAIN_TITLE}    Transact

Return Back to Home Screen
	Click on Done Button
	Click Back Arrow     ${BACK_ICON_BORR0W}
	Verify Screen Title    ${MAIN_TITLE}    Home


Remove Other Subsidiary Tags
  @{available_tags} =    Set Variable    ${TEST_TAGS}
  Log    ${available_tags}
  IF    $current_user['subsidiary'] == 'Kenya' and 'KE' in ${available_tags}
      Remove Tags    UG    RW    TZ    SS    DRC
#      Set Tags    ${current_user['subsidiary']}
  ELSE IF    $current_user['subsidiary'] == 'Uganda' and 'UG' in ${available_tags}
      Remove Tags    KE    RW    TZ    SS    DRC
#      Set Tags    ${current_user['subsidiary']}
  ELSE IF    $current_user['subsidiary'] == 'Rwanda' and 'RW' in ${available_tags}
      Remove Tags    KE    UG    TZ    SS    DRC
#      Set Tags    ${current_user['subsidiary']}
  ELSE IF    $current_user['subsidiary'] == 'Tanzania' and 'TZ' in ${available_tags}
      Remove Tags    KE    UG    RW    SS    DRC
#      Set Tags    ${current_user['subsidiary']}
  ELSE IF    $current_user['subsidiary'] == 'South_Sudan' and 'SS' in ${available_tags}
      Remove Tags    KE    UG    RW    TZ    DRC
#      Set Tags    ${current_user['subsidiary']}
  ELSE IF    $current_user['subsidiary'] == 'Congo' and 'DRC' in ${available_tags}
      Remove Tags    KE    UG    RW    TZ    SS
#      Set Tags    ${current_user['subsidiary']}
  ELSE
      Fail    msg=No subsidiary assigned to the user!
  END


Suite Teardown
  IF    $suite_setup_status == 'none'
      Log    ${TEST_TAGS}
  END
  Close All Applications

Test Setup
  Remove Other Subsidiary Tags


Check Error after Transaction OTP/PIN
    [Documentation]    Verify if the transaction has no Error after Keyed in OTP/PIN
	${PRESENCE_OF_POPUP}=    Run Keyword And Return Status    Wait Until Element Is Ready    ${TRY_AGAIN_BUTTON_ON_MODAL}
    ${TRY_AGAIN_BUTTON_WORD}=  Get Text      ${TRY_AGAIN_BUTTON_ON_MODAL}
    Log    ${TRY_AGAIN_BUTTON_WORD}
    Log To Console    ${TRY_AGAIN_BUTTON_WORD}
    IF  '${TRY_AGAIN_WORD}' == '${TRY_AGAIN_BUTTON_WORD}'
  	    ${ERROR_TITLE}=  Get Text      ${ERROR_TITLE}
        Log To Console    ${ERROR_TITLE}
    	${ERROR_DESCRIPTION}=  Get Text      ${ERROR_DESCRIPTION}
        Log To Console    ${ERROR_DESCRIPTION}
        Start Equity Application
    ELSE
    	Verify Screen Title    ${CONFIRMED_TITLE_FIELD}          Confirmed
    END


Bypass the explore later pop up
    ${explore_later_available} =    run keyword and return status    page should not contain element    ${EXPLORE_LATER}
    run keyword if    not ${explore_later_available}      click element    ${EXPLORE_LATER}


Initial App Launch and Nav to Homepage
    #Open Equity Mobile Application
    Open Equity Mobile Application on device 1
    sleep   5s
    Navigate to Login Page
    User Login With Valid Credential
	Key in OTP and Verify
	Select and Confirm an Option to Verify Security Question
	Answer First Security Question
	Answer Second Security Question
	Click on Confirm Security Question Button
	Bypassing the Quick Share on android 15
	Click on the Show Me Later Button
	Remove Existing Devices
    Click on the Show Me Later Button
    Validate Page Title
	Validate Customer Accounts are available

