*** Settings ***
Library    AppiumLibrary
Library     Collections
Library     String
Variables    ../Locators/CallDepositScreen.py
Variables    ../Locators/ClassicSavings.py
Variables    ../Locators/FixedDepositScreen.py
Variables    ../Locators/GoalSavings.py
Resource     CommonFunctions.robot
Library      DateTime


*** Keywords ***

open call deposit account
    [Arguments]    ${CALL_AMOUNT}
    sleep    7s
    click the open call button, enter amount, submit    ${CALL_AMOUNT}
    view interest rates and the terms and conditions
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
    view interest rates and the terms and conditions
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
    click the open call button, enter amount, submit    ${CALL_AMOUNT}


click the open call button, enter amount, submit
    [Arguments]    ${CALL_AMOUNT}
    Wait Until Page Contains Element    ${CALL_OPEN_ACCOUNT_BUTTON}    30s
    click element      ${OPEN_SAVINGS_ACCOUNT_NAV}
    Wait Until Page Contains Element    ${CALL_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CALL_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CALL_DEPOSIT_AMOUNT_FIELD}   10S
    Input Text    ${CALL_DEPOSIT_AMOUNT_FIELD}    ${CALL_AMOUNT}
    wait until page contains element    ${CALL_CONTINUE_ACTION_BUTTON}    20s
    Click Element    ${CALL_CONTINUE_ACTION_BUTTON}

    
view interest rates and the terms and conditions
    Wait Until Page Contains Element    ${VIEW_INTEREST_LINK}    7s
    Click Element     ${VIEW_INTEREST_LINK}
    wait until page contains element    ${LEAVE_INTEREST_PAGE}    20s
    sleep  15s
    Click Element    ${LEAVE_INTEREST_PAGE}
    Wait Until Element Is Visible    ${TERMS_LINK}    25s
    Click Element    ${TERMS_LINK}
    Sleep    10S
    Click Element    ${LEAVE_TERMS_PAGE}
    Click Element    ${TERMS_CHECKBOX}
    Click Element    ${CONFIRM_BUTTON}
    
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


Verify classic savings opens successfully
    click the save pillar and swipe down
    sleep     10s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    not ${other_saves}   open classic account    200000


open classic account
    [Arguments]    ${CLASSIC_AMOUNT}
    click the classic open button, enter amount, submit    ${CLASSIC_AMOUNT}
    confirm classic terms and conditions are attached
    verify the classic account opening completes successfully

click the classic open button, enter amount, submit
    [Arguments]    ${CLASSIC_AMOUNT}
    Verify user clicks open classic button and enters amount    ${CLASSIC_AMOUNT}
    wait until element is visible    ${CLASSIC_CONTINUE_ACTION_BUTTON}    7s
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}

Verify user clicks open classic button and enters amount
    [Arguments]    ${CLASSIC_AMOUNT}
    Wait Until Page Contains Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}   10S
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    ${CLASSIC_AMOUNT}


confirm classic terms and conditions are attached
    Wait Until Element Is Visible    ${CLASSIC_TERMS_LINK}    7s
    Click Element    ${CLASSIC_TERMS_LINK}
    sleep   15s
    Click Element    ${CLASSIC_EXIT_TERMS}
    Wait Until Element Is Visible    ${CLASSIC_TERMS_CHECKBOX}    10s
    Click Element    ${CLASSIC_TERMS_CHECKBOX}
    Click Element    ${CLASSIC_CONFIRM_BUTTON}


verify the classic account opening completes successfully
    Wait Until Element Is Visible    ${CLASSIC_APPLICATION_FEEDBACK}   60s
    ${feedback_text}=  Get Text    ${CLASSIC_APPLICATION_FEEDBACK}
    Should Be Equal     ${feedback_text}    ${CLASSIC_SUCCESS_TEXT}
    Click Element    ${CLASSIC_DONE_BUTTON}

Confirm the manual top up can be modified to recurring payment
    click element     ${SAVE_PILLAR}
    sleep    20s
#    @{parent_elements}    Get WebElements    xpath=//android.widget.ImageView[@content-desc="Save"]
#    log to console    Found ${parent_elements} parent elements with content-desc="Save"
    #click element    ${CLASSIC_FIRST_SAVE_CARD}
    #click element    ${CLASSIC_THIRD_SAVE_CARD}
    #click element    ${CLASSIC_SECOND_SAVE_CARD}

    @{child_elements}    Get WebElements    xpath=//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/accountName"]
    log to console    Found ${child_elements} TextView elements with accountName ID

    FOR    ${element}    IN    @{child_elements}
    ${text}    Get Text    ${element}
    Log to console   Found text: ${text}
    END



Confirm user clicks classic open button, enters amount, submit
    sleep    15s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}    Swipe Down Dynamically
    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    click the classic open button, enter amount, submit    500000


Confirm that user clicks on the open savings navigation and enters amount
     FOR    ${i}    IN RANGE    2
        swipe down dynamically
    END
    click element     ${OPEN_SAVINGS_ACCOUNT_NAV}
    Verify user clicks open classic button and enters amount    80000

Check that Recurring journey is selectable
    wait until element is visible    ${RECURRING_TRANSFER_BUTTON}          50s
    click element    ${RECURRING_TRANSFER_BUTTON}
    wait until element is visible    ${CLASSIC_CONTINUE_ACTION_BUTTON}    7s
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}

Verify That User Selects The Daily Frequency
    wait until element is visible    ${SELECT_FREQUENCY_DROPDOWN}          15s
    click element    ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${DAILY_PAYMENT}                       455s
    click element    ${DAILY_PAYMENT}

Verify That User Selects the Weekly Frequency
    wait until element is visible    ${SELECT_FREQUENCY_DROPDOWN}          15s
    click element    ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${WEEKLY_PAYMENT}                     45s
    click element    ${WEEKLY_PAYMENT}

Confirm the recurring amount is keyed in
    wait until page contains element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}     20s
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    50000
    click element    ${FIRST_PAYMENT_CALENDER}


Confirm that user enters Last payment date and completes the transaction successfully
#    ${formated_45_days_date} =    Get the date, 45 days after tomorrow
    click element    ${LAST_PAYMENT_CALENDER}
    wait until page contains element    ${SELECTED_DATE_PEN}    20s
    click element    ${NEXT_MONTH_ARROW}
#    Go to next page if the end date is not available
#    ${THIRTY_DAYS_LOCATOR}    Set Variable
#    ...    //android.widget.TextView[@content-desc="${formated_45_days_date}"]
#    click element    ${THIRTY_DAYS_LOCATOR}
    Get the date, 30 days after tomorrow
    click element     ${OK_BUTTON}
    click element    ${CLASSIC_CONTINUE_ACTION_BUTTON}
    wait until element is visible    ${CONTINUE_BUTTON}
    click element    ${CONTINUE_BUTTON}
    confirm classic terms and conditions are attached
    verify the classic account opening completes successfully


Move to the next screen if tomorrow's date is not available
    ${todays_date}    Get Current Date
    ${tomorrows_date}     add time to date    ${todays_date}     1 day
    ${tomorrows_formatted_date}    convert date    ${tomorrows_date}
    ...     result_format=%A, %B %-d    # use %#d if running on windows

    ${date_locator}    set variable
    ...    //android.widget.TextView[@content-desc="${tomorrows_formatted_date}"]
    sleep    5s

    ${tomorrows_date_is_available} =     run keyword and return status
    ...    page should contain element      ${date_locator}
    IF    ${tomorrows_date_is_available}
        click element                       ${date_locator}
    ELSE
        click element    ${NEXT_MONTH_ARROW}
        wait until element is visible    ${date_locator}    20s
        click element                       ${date_locator}
    END



Get the date, 34 days after tomorrow
    ${todays_date}    Get Current Date
    ${34_days_date_after_tomorrow}    Add Time To Date    ${todays_date}    35 days
    ${formated_34_days_date_after_tomorrow}    Convert Date    ${34_days_date_after_tomorrow}
    ...    result_format=%A, %B %-d    # use %#d if running on windows
    Log    34 days date after tomorrow is ${formated_34_days_date_after_tomorrow}

    ${date_locator}    Set Variable
    ...    //android.widget.TextView[@content-desc="${formated_34_days_date_after_tomorrow}"]

    ${formated_34_days_date_after_tomorrow_is_present} =    run keyword and return status
    ...    page should contain element    ${date_locator}    10s

    IF    ${formated_34_days_date_after_tomorrow_is_present}
        click element                     ${date_locator}
    ELSE
        click element       ${NEXT_MONTH_ARROW}
        wait until page contains element    ${date_locator}    20s
        click element                      ${date_locator}
    END





Open Fixed Deposit Account When There Are No Preexisting Save Accounts
    [Arguments]    ${FIXED_AMOUNT}
    wait until keyword succeeds    15s  1s
    ...    click open fixed deposit button
    Enter the fixed deposit amount and click the period dropdown
    ...    ${FIXED_AMOUNT}
    Select Fixed Deposit Period   3 Months
    Finish opening the fixed deposit account
    validate the fixed deposit A/C info
    Confirm the interest rates document is attached


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

Select Fixed Deposit Period
    [Arguments]    ${period}
    ${PERIOD_ELEMENT}=    Set Variable
    ...  //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text="${period}"]
    Click Element    ${PERIOD_ELEMENT}
    Log    Selected period: ${period}



Finish opening the fixed deposit account
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
    sleep    10s
    wait until element is visible    ${FIXED_DONE_BUTTON}  80s
    Click Element    ${FIXED_DONE_BUTTON}


verify user can open fixed deposit account
    click the save pillar and swipe down
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    not ${other_saves}
    ...    Open Fixed Deposit Account When There Are No Preexisting Save Accounts
    ...    2000000


verify user can open and close fixed deposit account
    sleep    10s
    ${first_fixed_opened} =    run keyword and return status
    ...    page should contain element    ${FIXED_DEPOSIT_TEXT}
    run keyword if    ${first_fixed_opened}
    ...    open and close fixed deposit when other save product is opened   1700000


open and close fixed deposit when other save product is opened
    [Arguments]    ${FIXED_AMOUNT}
    wait until element is visible    ${BACK_ARROW}    10s
    click element    ${BACK_ARROW}
    Open fixed deposit account if there are preexisting save accounts    ${FIXED_AMOUNT}
    Navigate and Close the fixed account


Confirm User Opens fixed deposit - Reinvest journey
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Open Fixed Deposit Reinvest, opened save products present   6500000


Open fixed deposit account if there are preexisting save accounts
    [Arguments]    ${FIXED_AMOUNT}
    check if there are save accounts on the landing page
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}  20s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    sleep    7s
    swipe down dynamically
    wait until keyword succeeds    15s    1
    ...    click open fixed deposit button 2nd time
    Enter the fixed deposit amount and click the period dropdown    ${FIXED_AMOUNT}
    Select Fixed Deposit Period   3 Months
    Finish opening the fixed deposit account
    Sleep    15s


Enter the fixed deposit amount and click the period dropdown
    [Arguments]    ${FIXED_AMOUNT}
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}    7s
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    wait until element is visible    ${DEPOSIT_PERIOD_DROPDOWN}    7s
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s


swipe down dynamically if the open save account button not visible
    ${is_save_open_button_visible}=    Run Keyword And Return Status
    ...    Page Should Contain Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Run Keyword If    not ${is_save_open_button_visible}
    ...    Swipe Down Dynamically


Key in the Reinvest details
     Click Element    ${REINVEST_BUTTON}
     sleep  10s
     Swipe Down Dynamically
     Wait Until Page Contains Element    ${CHOOSE_REINVESTMENT_OPTION}   20s
     Click Element     ${CHOOSE_REINVESTMENT_OPTION}
     Wait Until Page Contains Element    ${REINVEST_PRINCIPAL_AND_INTEREST}    45s
     Click Element    ${REINVEST_PRINCIPAL_AND_INTEREST}


Open Fixed Deposit Reinvest, opened save products present
    [Arguments]    ${FIXED_AMOUNT}
    click open fixed deposit button 2nd time
    Enter the fixed deposit amount and click the period dropdown    ${FIXED_AMOUNT}
    Select Fixed Deposit Period    3 Months
    Key in the Reinvest details
    Finish opening the fixed deposit account
    sleep   15s

    
check fixed deposit statement
    Click Element    ${FIRST_FIXED_DEPOSIT_CARD}
    Wait Until Page Contains Element    ${TRANSACTION_HISTORY}   45S
    ${opened_fixed_amount} =  Get Text    ${FIXED_TRANSACTION_AMOUNT}
    Log To Console    The opened fixed amount is ${opened_fixed_amount}

validate the fixed deposit A/C info
    sleep    10s
    swipe down dynamically
    wait until element is visible    ${FIXED_DEPOSIT_I}    7s
    select the fixed deposit account card
    Wait Until Page Contains Element    ${FIXED_ACCOUNT_INFORMATION}  20s
    sleep  10s
    Click Element    ${FIXED_ACCOUNT_INFORMATION}
    Wait Until Page Contains Element    ${FIXED_DEPOSIT_PERIOD}   45s
    ${fixed_period} =   Get Text    ${FIXED_DEPOSIT_PERIOD}
    Log To Console    Period = ${fixed_period}
    sleep    10s

Confirm the interest rates document is attached
    Click Element    ${INTEREST_RATE_INFORMATION}
    Wait Until Page Contains Element    ${LEAVE_INTEREST_RATE_PAGE}   60s
    sleep   10s
    Click Element    ${LEAVE_INTEREST_RATE_PAGE}
    Click Element    ${BACK_BUTTON}

Navigate and Close the fixed account
    wait until element is visible    ${FIXED_SAVE_CARD}    30s
    click element   ${FIXED_SAVE_CARD}
    confirm user closes the fixed deposit account


confirm user closes the fixed deposit account
    sleep    10s
    wait until element is visible    ${CLOSE_ACCOUNT_ICON}  45s
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
    ${fixed_deposit_is_1st}=      run keyword and return status
    ...    wait until element is visible  ${FIXED_DEPOSIT_FIRST}   60s
    run keyword if    ${fixed_deposit_is_1st}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON1}



    ${fixed_deposit_is_2nd}=     run keyword and return status
    ...    wait until element is visible  ${FIXED_DEPOSIT_SECOND}  60s
    run keyword if    ${fixed_deposit_is_2nd}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON2}



    ${fixed_deposit_is_3rd}=     run keyword and return status
    ...    wait until element is visible  ${FIXED_DEPOSIT_THIRD}  60s
    run keyword if    ${fixed_deposit_is_3rd}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON3}





click open fixed deposit button 2nd time
    ${fixed2_deposit_is_1st} =    run keyword and return status
    ...    wait until element is visible  ${FIXED_DP_FIRST}  30S
    run keyword if    ${fixed2_deposit_is_1st}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON1}



    ${fixed2_deposit_is_2nd} =      run keyword and return status
    ...    wait until element is visible     ${FIXED_DP_SECOND}  30S
    run keyword if    ${fixed2_deposit_is_2nd}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON2}



    ${fixed3_deposit_is_3rd} =       run keyword and return status
    ...    wait until element is visible        ${FIXED_DP_THIRD}  30s
    run keyword if    ${fixed3_deposit_is_3rd}    click element
    ...    ${FIXED_OPEN_ACCOUNT_BUTTON3}



Open goal account when there are no other save accounts
    click the save pillar and swipe down
    ${no_saves} =    run keyword and return status
    ...    page should not contain element    ${OPEN_SAVINGS_ACCOUNT_NAV}   7s
    run keyword if   ${no_saves}    Open goal savings account  Stationery  1300000   5000000



Open Goal account when there are other save accounts
    sleep     10s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Open goal savings account    Tuition    1500000    6500000



Open goal savings account
    [Arguments]    ${GOAL_TEXT}    ${GOAL_OPENING_AMOUNT}    ${TARGET_AMOUNT}
    Check that the app can swipe down twice
    Confirm user selects goal category and enters the goal name    ${GOAL_TEXT}
    check the goal opening amount is keyed in    ${GOAL_OPENING_AMOUNT}
    Verify user is navigated to next page upon clicking continue button
    Confirm user enters the target amount    ${TARGET_AMOUNT}
    Verify user is navigated to next page upon clicking continue button
    check that user clicks on continue and swipes to interest rates link
    view interest rates and the terms and conditions
    Confirm clicking the done button completes opening of the goal account
    Check that the app can swipe down twice


Convert the goal manual top up to recurring payments
    [Arguments]     ${GOAL_TEXT}
    sleep    10s
    click the goal text element    ${GOAL_TEXT}
    wait until element is visible    ${GOAL_MANAGE_PAYMENTS_BUTTON}     20s
    click element    ${GOAL_MANAGE_PAYMENTS_BUTTON}
    wait until element is visible    ${MANUAL_TOP_UP_TEXT}      15s
    click element    ${ADD_RECURRING_PAYMENT_BUTTON}
    wait until page contains element    ${SELECT_FREQUENCY_DROPDOWN}    15s
    click element     ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${DAILY_PAYMENT_OPTION}     70s
    click element    ${DAILY_PAYMENT_OPTION}
    wait until page contains element    ${START_DATE_CALENDER}    10s
    click element     ${START_DATE_CALENDER}
    Move to the next screen if tomorrow's date is not available
    click element     ${OK_BUTTON}
    wait until element is visible    ${END_DATE_CALENDER}      15s
    click element    ${END_DATE_CALENDER}
    Get the date, 34 days after tomorrow
    click element     ${OK_BUTTON}
    wait until element is visible    ${TARGET_DATE_CALENDER}     15s
    click element    ${TARGET_DATE_CALENDER}
    #Get the date, 34 days after tomorrow
    ${todays_date}    Get Current Date
    ${34_days_date_after_tomorrow}    Add Time To Date    ${todays_date}    45 days
    ${formated_34_days_date_after_tomorrow}    Convert Date    ${34_days_date_after_tomorrow}
    ...    result_format=%A, %B %-d    # use %#d if running on windows
    Log    34 days date after tomorrow is ${formated_34_days_date_after_tomorrow}

    ${date_locator}    Set Variable
    ...    //android.widget.TextView[@content-desc="${formated_34_days_date_after_tomorrow}"]

    ${formated_34_days_date_after_tomorrow_is_present} =    run keyword and return status
    ...    page should contain element    ${date_locator}    10s

    click element                     ${date_locator}
    click element     ${OK_BUTTON}
    wait until element is visible    ${RECURRING_CONTINUE_BUTTON}    10s
    click element    ${RECURRING_CONTINUE_BUTTON}
    wait until page contains element    ${RECURRING_PAYMENT_CONFIRM_BUTTON}    30s
    click element    ${RECURRING_PAYMENT_CONFIRM_BUTTON}
    wait until page contains element    ${YES_SURE_BUTTON}    45s
    click element    ${YES_SURE_BUTTON}
    wait until element is visible    ${MANUAL_PAYMENT_EDIT_DONE_BUTTON}    80s
    click element    ${MANUAL_PAYMENT_EDIT_DONE_BUTTON}
    Close the goal account    Tuition


Close the goal account
    [Arguments]    ${GOAL_TEXT}
    Check that the app can swipe down twice
    sleep    10s
    click the goal text element    ${GOAL_TEXT}
    wait until element is visible    ${CLOSE_GOAL_ICON}    15s
    click element    ${CLOSE_GOAL_ICON}
    wait until element is visible    ${CLOSE_CONFIRM_BUTTON}    30s
    click element    ${CLOSE_CONFIRM_BUTTON}
    wait until element is visible    ${CONFIRM_CLOSURE_BUTTON}  30s
    click element    ${CONFIRM_CLOSURE_BUTTON}
    wait until element is visible    ${DONE_BUTTON}    70s
    click element     ${DONE_BUTTON}

Check that the app can swipe down twice
     FOR    ${i}    IN RANGE    2
        swipe down dynamically
    END


Goal Recurring transfer Journey
    [Arguments]    ${GOAL_TEXT}    ${GOAL_OPENING_AMOUNT}    ${TARGET_AMOUNT}
    sleep    10s
    Check that the app can swipe down twice
    Confirm user selects goal category and enters the goal name    ${GOAL_TEXT}
    check the goal opening amount is keyed in    ${GOAL_OPENING_AMOUNT}
    click element    ${ACTIVATE_RECURRING_BUTTON}
    wait until page contains element    ${RECURRING_CONTINUE_BUTTON}    10s
    click element    ${RECURRING_CONTINUE_BUTTON}
    Confirm user enters the target amount    ${TARGET_AMOUNT}
    wait until page contains element    ${SELECT_FREQUENCY_DROPDOWN}    15s
    click element     ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${DAILY_PAYMENT_OPTION}     70s
    click element    ${DAILY_PAYMENT_OPTION}
    wait until page contains element    ${START_DATE_CALENDER}    10s
    click element     ${START_DATE_CALENDER}
    Move to the next screen if tomorrow's date is not available
    click element     ${OK_BUTTON}
    wait until element is visible    ${END_DATE_CALENDER}      15s
    click element    ${END_DATE_CALENDER}
    wait until page contains element    ${SELECTED_DATE_PEN}    20s
    Get the date, 34 days after tomorrow
    click element     ${OK_BUTTON}
    wait until element is visible    ${TARGET_DATE_CALENDER}     15s
    click element    ${TARGET_DATE_CALENDER}
#    wait until element is visible    ${THIRTY_DAYS_LOCATOR}     10s
#    click element    ${THIRTY_DAYS_LOCATOR}
    ${todays_date}    Get Current Date
    ${34_days_date_after_tomorrow}    Add Time To Date    ${todays_date}    45 days
    ${formated_34_days_date_after_tomorrow}    Convert Date    ${34_days_date_after_tomorrow}
    ...    result_format=%A, %B %-d    # use %#d if running on windows
    Log    34 days date after tomorrow is ${formated_34_days_date_after_tomorrow}

    ${date_locator}    Set Variable
    ...    //android.widget.TextView[@content-desc="${formated_34_days_date_after_tomorrow}"]

    ${formated_34_days_date_after_tomorrow_is_present} =    run keyword and return status
    ...    page should contain element    ${date_locator}    10s
    click element    ${date_locator}

    click element     ${OK_BUTTON}
    wait until element is visible    ${RECURRING_CONTINUE_BUTTON}    10s
    click element    ${RECURRING_CONTINUE_BUTTON}
    check that user clicks on continue and swipes to interest rates link
    view interest rates and the terms and conditions
    Confirm clicking the done button completes opening of the goal account
    Close the goal account    ${GOAL_TEXT}
    Check that the app can swipe down twice
    sleep    5s




click the goal text element
    [Arguments]    ${GOAL_TEXT}
    ${GOAL_CARD}    Set variable
    ...    //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/accountName" and @text="${GOAL_TEXT}"]
    ${GOAL_TEXT_ELEMENT_FOUND} =    run keyword and return status    page should contain element    ${GOAL_CARD}
    IF    ${GOAL_TEXT_ELEMENT_FOUND}
        click element    ${GOAL_CARD}
    ELSE
        click element    ${VIEW_ALL_LINK}
        click element    ${GOAL_CARD}
    END


Confirm user selects goal category and enters the goal name
    [Arguments]    ${GOAL_TEXT}
    wait until element is visible    ${OPEN_SAVINGS_ACCOUNT_NAV}    10s
    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    swipe down dynamically
    wait until element is visible    ${OPEN_GOAL_BUTTON}  10s
    click element    ${OPEN_GOAL_BUTTON}
    wait until element is visible    ${GOAL_CATEGORY_DROPDOWN}    10s
    click element    ${GOAL_CATEGORY_DROPDOWN}
    wait until element is visible    ${EDUCATION_FUND_RADIO_BUTTON}    20s
    click element     ${EDUCATION_FUND_RADIO_BUTTON}
    input text    ${GOAL_INPUT_TEXT_FIELD}     ${GOAL_TEXT}

check the goal opening amount is keyed in
    [Arguments]    ${GOAL_OPENING_AMOUNT}
    wait until element is visible    ${GOAL_CONTINUE_BUTTON}    15s
    click element    ${GOAL_CONTINUE_BUTTON}
    wait until page contains element    ${GOAL_OPENING_AMOUNT_FIELD}    20s
    input text    ${GOAL_OPENING_AMOUNT_FIELD}    ${GOAL_OPENING_AMOUNT}

Confirm user enters the target amount
    [Arguments]    ${TARGET_AMOUNT}
    wait until page contains element    ${TARGET_AMOUNT_FIELD}    15s
    input text    ${TARGET_AMOUNT_FIELD}    ${TARGET_AMOUNT}


check that user clicks on continue and swipes to interest rates link
    Verify user is navigated to next page upon clicking continue button
    sleep    7s
    swipe down dynamically

Confirm clicking the done button completes opening of the goal account
    wait until element is visible    ${GOAL_DONE_BUTTON}     70s
    click element    ${GOAL_DONE_BUTTON}
    sleep    10s


Verify user is navigated to next page upon clicking continue button
    wait until element is visible     ${CONTINUE_BUTTON}    10s
    click element    ${CONTINUE_BUTTON}















