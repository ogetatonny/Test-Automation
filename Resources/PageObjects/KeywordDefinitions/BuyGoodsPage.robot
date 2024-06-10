*** Settings ***
Library               AppiumLibrary       15      run_on_failure=Log Source
Library               Process
Library  Screenshot    default_directory=../Screenshots
Resource    ../KeywordDefinitions/CommonFunctions.robot
Variables    ../Locators/BuyGoodsScreen.py
Resource    ../KeywordDefinitions/SendMoney.robot


*** Keywords ***
Click on Buy Goods
	Scroll Down the App
	Click Transaction Items     Buy goods
	Verify Screen Title    ${SCREEN_TITLE_FIELD}      Buy goods

Select a Merchant
	Wait Until Element Is Ready And Click     ${PAY_T0_FIELD}
	Verify Screen Title                       ${SCREEN_TITLE_TEXT}      Please select a merchant

Click on Enter Till Number
	Wait Until Element Is Ready And Click     ${TILL_NUMBER_BUTTON}
	Verify Screen Title                       ${SCREEN_TITLE_TEXT}    	Select a merchant

Enter Merchant Details - Till Number
	[Arguments]    ${TillNumber}
	Wait Until Element Is Ready    ${TILL_NUMBER_TEXTFIELD}
	Input Text    ${TILL_NUMBER_TEXTFIELD}        ${TillNumber}

Click on Continue Button After Till Number
	Wait Until Element Is Ready And Click    ${CONTINUE_BUTTON_AFTER_TILL_NUMBER}
	Verify Screen Title                      ${SCREEN_TITLE_FIELD}		Buy goods

Click on Buy Good Button
	Wait Until Element Is Ready And Click    ${BUY_GOODS_BUTTON}

Click on Confirm
	Wait Until Element Is Ready And Click    ${CONFIRM_BUY_BUTTON}

Verify that the Buy Goods Transaction is Successful
	 Wait Until Element Is Ready            ${SUCCESS_MSG_FIELD}
	${LABEL-TEXT}=  Get Text                ${SUCCESS_MSG_FIELD}
	Should Be Equal As Strings              ${LABEL-TEXT}                Your payment was successful

Add Favourite Merchant
	 Wait Until Element Is Ready And Click     ${ADD_TO_FAVOURITES}
	 Wait Until Element Is Ready     ${FAVOURITES_NAME}
     Input Text    ${FAVOURITES_NAME}        favoriteName
     Click Element    ${ADD_BENEFICIARY_CONTINUE_BUTTON}
     Verify Screen Title    ${MERCHANT_LABEL}    The merchant has been added successfully
     Wait Until Element Is Ready And Click    ${DONE_BUTTON}

Verify Add Favourite Feature
	${status}   Run Keyword And Return Status    Element Should Be Visible      ${ADD_TO_FAVOURITES}
    Run Keyword If     '${status}' == 'True'     Add Favourite Merchant
    ...    ELSE        Wait Until Element Is Ready    ${DONE_BUTTON}

Buy Goods From Merchant
    [Documentation]    Buy Goods From Merchant
    [Arguments]    ${TillNumber}
	${random_number}    Evaluate    random.randint(${user_subsidiary["BuyGood_minimum"]}, ${user_subsidiary["BuyGood_maximum"]})
    Select a Merchant
    Click on Enter Till Number
    Enter Merchant Details - Till Number        ${TillNumber}
    Click on Continue Button After Till Number
    Enter Amount          ${random_number}
	Enter Payment Reason      Buy Goods From Merchant
	Sleep    5 sec
	Click on Buy Good Button
	Verify Payment Confirmation
	Charge Fee Verification     ${user_subsidiary["buy_good_charge_fee"]}
	Click on Confirm
    Transaction Verification
    Verify that the transaction is Successful
    Verify that the Buy Goods Transaction is Successful
    Verify Add Favourite Feature
    Click on Done Button
    Verify Screen Title    ${MAIN_TITLE}    Home

