*** Settings ***
Library    AppiumLibrary
Variables    ../Locators/CallDepositScreen.py
Variables    ../Locators/ClassicSavings.py
Variables    ../Locators/FixedDepositScreen.py


*** Variables ***
${START_Y}    80  # Start point as percentage of screen height
${END_Y}      5  # End point as percentage of screen height
${X_COORD}    50  # X coordinate as percentage of screen width

*** Keywords ***

open call deposit account
    [Arguments]    ${CALL_AMOUNT}
    sleep    7s
    Wait Until Page Contains Element    ${CALL_OPEN_ACCOUNT_BUTTON}    30s
    Click Element    ${CALL_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CALL_DEPOSIT_AMOUNT_FIELD}   10S
    Input Text    ${CALL_DEPOSIT_AMOUNT_FIELD}    ${CALL_AMOUNT}
    Click Element    ${CALL_CONTINUE_ACTION_BUTTON}
    view call interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    withraw an amount from the call deposit account    500000

Open call deposit account when there are no other save accounts
    click the save pillar and swipe down
    ${no_saves} =    run keyword and return status
    ...    page should not contain element    ${OPEN_SAVINGS_ACCOUNT_NAV}   7s
    run keyword if   ${no_saves}    open call deposit account    2000000


click the save pillar and swipe down
    wait until page contains element     ${SAVE_PILLAR}    75s
    click element     ${SAVE_PILLAR}
    sleep    30s
    FOR    ${i}    IN RANGE    2
        swipe down dynamically
    END


Navigate to the save page select call deposit and enter amount
    [Arguments]    ${CALL_AMOUNT}
    Open call deposit account when there are other save accounts
    view call interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    withraw an amount from the call deposit account    500000


Open call deposit account when there are other save accounts
    sleep     10s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}
    ...    click on the savings account navigation and enter the save details
    ...    1500000


check if there are save accounts on the landing page
     FOR    ${i}    IN RANGE    2
        swipe down dynamically
    END
   ${other_saves} =    run keyword and return status
    ...    page should contain element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    RETURN    ${other_saves}

click on the savings account navigation and enter the save details
    [Arguments]    ${CALL_AMOUNT}
    sleep    15s
    FOR    ${i}    IN RANGE    2
        swipe down dynamically
    END
    click element      ${OPEN_SAVINGS_ACCOUNT_NAV}
    Wait Until Page Contains Element    ${CALL_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CALL_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CALL_DEPOSIT_AMOUNT_FIELD}   10S
    Input Text    ${CALL_DEPOSIT_AMOUNT_FIELD}    ${CALL_AMOUNT}
    wait until page contains element    ${CALL_CONTINUE_ACTION_BUTTON}    20s
    Click Element    ${CALL_CONTINUE_ACTION_BUTTON}

    
view call interest rates and the terms and conditions
    Wait Until Page Contains Element    ${VIEW_INTEREST_LINK}    7s
    Click Element     ${VIEW_INTEREST_LINK}
    wait until page contains element    ${LEAVE_INTEREST_PAGE}    20s
    sleep  15s
    Click Element    ${LEAVE_INTEREST_PAGE}
    Wait Until Element Is Visible    ${CALL_TERMS_LINK}    25s
    Click Element    ${CALL_TERMS_LINK}
    Sleep    10S
    Click Element    ${LEAVE_TERMS_PAGE}
    Click Element    ${CALL_TERMS_CHECKBOX}
    Click Element    ${CALL_CONFIRM_BUTTON}
    
view call deposit feedback display and complete the application
    Wait Until Element Is Visible    ${CALL_APPLICATION_FEEDBACK}   80s
    ${feedback_text}=  Get Text    ${CALL_APPLICATION_FEEDBACK}
    Should Be Equal     ${feedback_text}    ${CALL_APPLICATION_FEEDBACK_TEXT}
    Click Element    ${APPLICATION_DONE_BUTTON}

withraw an amount from the call deposit account
    [Arguments]    ${amount}
    sleep    20s
    wait until page contains element    ${CALL_DEPOSIT_CARD}     60s
    click element    ${CALL_DEPOSIT_CARD}
    sleep    5s
    wait until page contains element    ${WITHDRAW_ICON}    20s
    click element     ${WITHDRAW_ICON}
    run keyword and ignore error    click element     ${WITHDRAW_ICON}
    wait until page contains element    ${CONTINUE_WITHDRAW}    30s
    click element    ${CONTINUE_WITHDRAW}
    sleep    7s
    input text    ${WITHDRAWAL_AMOUNT_FIELD}     ${amount}
    wait until element is visible    ${CONTINUE_WITHDRAWAL}    20s
    click element    ${CONTINUE_WITHDRAWAL}
    wait until page contains element    ${CONFIRM_WITHDRAW}    20s
    click element    ${CONFIRM_WITHDRAW}
    wait until page contains element    ${CONFIRM_WITHDRAWAL}    15s
    click element    ${CONFIRM_WITHDRAWAL}
    wait until page contains element    ${WITHDRAWAL_DONE_BUTTON}    60s
    click element      ${WITHDRAWAL_DONE_BUTTON}
    sleep    15s


close the open call deposit account
    sleep    15s
    wait until page contains element    ${CALL_DEPOSIT_CARD}     60s
    click element    ${CALL_DEPOSIT_CARD}
    wait until element is visible    ${CLOSE_ACCOUNT}    20s
    sleep    10s
    click element    ${CLOSE_ACCOUNT}
    sleep     15s
    wait until element is visible    ${CONFIRM1_BUTTON}    45s
    click element     ${CONFIRM1_BUTTON}
    wait until page contains element    ${CONFIRM_CLOSURE}    50s
    click element     ${CONFIRM_CLOSURE}
    wait until page contains element    ${DONE_BUTTON}    50s
    click element    ${DONE_BUTTON}
    
Navigate to the save page select classic savings and enter amount
    [Arguments]    ${CLASSIC_AMOUNT}
    Click Element    ${SAVE_PILLAR}
    sleep  20s
    Wait Until Keyword Succeeds    10s    1s
    ...    check if No savings account error is available on the screen
    Wait Until Page Contains Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}   10S
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    ${CLASSIC_AMOUNT}
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}

    
view classic account terms and conditions
    Wait Until Element Is Visible    ${CLASSIC_TERMS_LINK}    7s
    Click Element    ${CLASSIC_TERMS_LINK}
    sleep   10s
    Click Element    ${CLASSIC_EXIT_TERMS}
    Wait Until Element Is Visible    ${CLASSIC_TERMS_CHECKBOX}    10s
    Click Element    ${CLASSIC_TERMS_CHECKBOX}
    Click Element    ${CLASSIC_CONFIRM_BUTTON}
    
view classic account feedback display and complete the classic account application
    Wait Until Element Is Visible    ${CLASSIC_APPLICATION_FEEDBACK}   60s
    ${feedback_text}=  Get Text    ${CLASSIC_APPLICATION_FEEDBACK}
    Should Be Equal     ${feedback_text}    ${CLASSIC_SUCCESS_TEXT}
    Click Element    ${CLASSIC_DONE_BUTTON}
    
Open classic Savings account when no other savings accounts had been opened
    Navigate to the save page select classic savings and enter amount    200000
    view classic account terms and conditions
    view classic account feedback display and complete the classic account application
    
open classic savings account
    ${other_savings_account_available}=    Run Keyword And Return Status
    ...    Open classic Savings account when no other savings accounts had been opened
    Run Keyword If    not ${other_savings_account_available}
    ...    open another classic account if there is a preexisting one
    
open another classic account if there is a preexisting one
    ${save_navigation}=   Run Keyword And Return Status
    ...    Navigate to the save page select classic savings and enter amount  600000
    Run Keyword If    not ${save_navigation}
    ...    move from the save pillar to opening of the save account(classic)
    
move from the save pillar to opening of the save account(classic)
    swipe down dynamically if the open save account button not visible
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}  10s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Wait Until Page Contains Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}   10S
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    400000
    Wait Until Element Is Visible    ${CLASSIC_CONTINUE_ACTION_BUTTON}
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}
    view classic account terms and conditions
    view classic account feedback display and complete the classic account application


Open Fixed Deposit Account When There Are No Preexisting Save Accounts
    [Arguments]    ${FIXED_AMOUNT}
    wait until keyword succeeds    15s  1s
    ...    click open fixed deposit button
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}     45s
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s
    Fixed Deposit Period    3 Months
    complete opening of the fixed deposit account
    check the fixed deposit account information


select the fixed deposit account card
    sleep    10s

    ${one_fixed_only} =   run keyword and return status
    ...    page should contain element      ${FIXED_FIRST_CARD}    15s
    run keyword if     ${one_fixed_only}    click element
    ...    ${FIXED_FIRST_CARD}

    ${2nd_fixed} =       run keyword and return status
    ...    page should contain element      ${FIXED_2ND_CARD}      10S
    run keyword if     ${2nd_fixed}         click element
    ...    ${FIXED_2ND_CARD}


check if USD currency is available on the screen and enter the USD amount
    ${is_USD_Currency} =    run keyword and return status
    ...    page should not contain element    ${USD_CURRENCY}
    run keyword if   not ${is_USD_Currency}    Enter the save amount in USD

Enter the save amount in USD
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}     45s
    Input Text    ${FIXED_AMOUNT_FIELD}    5000

Fixed Deposit Period
    [Arguments]    ${period}
    ${PERIOD_ELEMENT}=    Set Variable
    ...    //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text="${period}"]
    Click Element    ${PERIOD_ELEMENT}
    Log    Selected period: ${period}


check if No savings account error is available on the screen
    ${no_savings_account}=   Run Keyword And Return Status
    ...    Page Should Not Contain Element     ${NO_SAVINGS_DISPLAY}
    Run Keyword If   not ${no_savings_account}
    ...    wait until the No savings error display appears on the screen

wait until the No savings error display appears on the screen
    Wait Until Element Is Visible    ${NO_SAVINGS_DISPLAY}   10S
    Wait Until Page Contains Element    ${NO_SAVINGS_DISMISS_BUTTON}  7s
    Click Element    ${NO_SAVINGS_DISMISS_BUTTON}

complete opening of the fixed deposit account
    Wait Until Element Is Visible    ${FIXED_CONTINUE_BUTTON}   60s
    Click Element    ${FIXED_CONTINUE_BUTTON}
    Wait Until Page Contains Element    ${FIXED_DEPOSIT_CONFIRMATION}  10S
    Wait Until Element Is Visible    ${FIXED_TERMS_LINK}  30s
    Click Element    ${FIXED_TERMS_LINK}
    Wait Until Page Contains Element    ${FIXED_TERMS_PAGE}  10s
    sleep  8s
    Click Element    ${FIXED_TERMS_EXIT}
    Click Element    ${FIXED_TERMS_CHECKBOX}
    Click Element    ${FIXED_CONFIRM_BUTTON}
    Wait Until Page Contains    ${FIXED_SUCCESS_TEXT}  45s
    Click Element    ${FIXED_DONE_BUTTON}
    Wait Until Element Is Visible    ${CREATED_FIXED_CARD}   30s

verify user can open fixed deposit account
    click the save pillar and swipe down
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    not ${other_saves}
    ...    Open Fixed Deposit Account When There Are No Preexisting Save Accounts
    ...    2000000

verify user can open and close fixed deposit account
    sleep    5s
    ${first_fixed_opened} =    run keyword and return status    page should contain element    ${FIXED_DEPOSIT_TEXT}
    run keyword if    ${first_fixed_opened}    open and close fixed deposit when no other save product is opened   1700000


open and close fixed deposit when no other save product is opened
    [Arguments]    ${FIXED_AMOUNT}
    wait until element is visible    ${BACK_ARROW}    10s
    click element    ${BACK_ARROW}
    Open fixed deposit account if there are preexisting save accounts    ${FIXED_AMOUNT}
    Close the fixed account


Open fixed deposit account through the reinvest journey
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}
    ...    Open Fixed Deposit Reinvest journey when there are other preexisting accounts   650000


Open fixed deposit account if there are preexisting save accounts
    [Arguments]    ${FIXED_AMOUNT}
    check if there are save accounts on the landing page
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}  60s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    sleep    5s
    click element    xpath=(//android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/actionOneButton"])[3]
    #click open fixed deposit button
    #run keyword and ignore error    click open fixed deposit button
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}    15s
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    sleep    10s
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s
    Fixed Deposit Period    3 Months
    complete opening of the fixed deposit account
    Sleep    15s
    #check fixed deposit statement



Swipe Down Dynamically
    ${screen_width}    Get Window Width
    ${screen_height}   Get Window Height
    ${start_x}    Evaluate    ${screen_width} * ${X_COORD} / 100
    ${start_y}    Evaluate    ${screen_height} * ${START_Y} / 100
    ${end_y}      Evaluate    ${screen_height} * ${END_Y} / 100
    Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    1000

swipe down dynamically if the open save account button not visible
    ${is_save_open_button_visible}=    Run Keyword And Return Status
    ...    Page Should Contain Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Run Keyword If    not ${is_save_open_button_visible}     Swipe Down Dynamically

swipe up dynamically
    ${screen_width}    Get Window Width
    ${screen_height}   Get Window Height
    ${start_x}    Evaluate    ${screen_width} * ${X_COORD} / 100
    ${start_y}    Evaluate    ${screen_height} * ${START_Y} / 100
    ${end_y}      Evaluate    ${screen_height} * ${END_Y} / 100
    Swipe    ${start_x}    ${end_y}    ${start_x}    ${start_y}    1000
    
Key in the Reinvest details
     Click Element    ${REINVEST_BUTTON}
     sleep  10s
     Swipe Down Dynamically
     Wait Until Page Contains Element    ${CHOOSE_REINVESTMENT_OPTION}   20s
     Click Element     ${CHOOSE_REINVESTMENT_OPTION}
     Wait Until Page Contains Element    ${REINVEST_PRINCIPAL_AND_INTEREST}    45s
     Click Element    ${REINVEST_PRINCIPAL_AND_INTEREST}


Open Fixed Deposit Reinvest journey when there are other preexisting accounts
    [Arguments]    ${FIXED_AMOUNT}
    swipe down dynamically if the open save account button not visible
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}  10s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}    10s
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s
    Fixed Deposit Period    3 Months
    Key in the Reinvest details
    complete opening of the fixed deposit account
    sleep   15s
    #check fixed deposit statement
    
check fixed deposit statement
    Click Element    ${FIRST_FIXED_DEPOSIT_CARD}
    Wait Until Page Contains Element    ${TRANSACTION_HISTORY}   45S
    ${opened_fixed_amount} =  Get Text    ${FIXED_TRANSACTION_AMOUNT}
    Log To Console    The opened fixed amount is ${opened_fixed_amount}

check the fixed deposit account information
    select the fixed deposit account card
    Wait Until Page Contains Element    ${FIXED_ACCOUNT_INFORMATION}  20s
    sleep  10s
    Click Element    ${FIXED_ACCOUNT_INFORMATION}
    Wait Until Page Contains Element    ${FIXED_DEPOSIT_PERIOD}   45s
    ${fixed_period} =   Get Text    ${FIXED_DEPOSIT_PERIOD}
    Log To Console    The fixed deposit period is ${fixed_period}
    sleep    10s
    Click Element    ${INTEREST_RATE_INFORMATION}
    Wait Until Page Contains Element    ${LEAVE_INTEREST_RATE_PAGE}   60s
    sleep   10s
    Click Element    ${LEAVE_INTEREST_RATE_PAGE}
    Click Element    ${BACK_BUTTON}

Close the fixed account
    sleep    10s
    Wait Until Page Contains Element    ${CLOSE_ACCOUNT_ICON}  45s
    Click Element    ${CLOSE_ACCOUNT_ICON}
    Wait Until Page Contains Element    ${CLOSE_ACCOUNT_BUTTON}  30s
    Click Element    ${CLOSE_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CONFIRM_DETAILS_BUTTON}  20s
    Click Element    ${CONFIRM_DETAILS_BUTTON}
    Wait Until Page Contains Element     ${CLOSE_ACCOUNT_BUTTON}   35s
    Click Element    ${CLOSE_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLOSED_DONE_BUTTON}    45s
    Click Element    ${CLOSED_DONE_BUTTON}


click open fixed deposit button
    ${fixed_deposit_is_2nd} =    run keyword and return status
    ...    page should contain element    ${FIXED_DEPOSIT_SECOND}
    run keyword if    ${fixed_deposit_is_2nd}
    ...    click element   ${FIXED_OPEN_ACCOUNT_BUTTON2}

    ${fixed_deposit_is_3rd} =    run keyword and return status
    ...    page should contain element    ${FIXED_DEPOSIT_THIRD}
    run keyword if    ${fixed_deposit_is_3rd}
    ...    click element   ${FIXED_OPEN_ACCOUNT_BUTTON3}



