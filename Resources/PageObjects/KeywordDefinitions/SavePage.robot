*** Settings ***
Library      AppiumLibrary
Library      Collections
Library      BuiltIn
Library      String
Variables    ../Locators/CallDepositScreen.py
Variables    ../Locators/ClassicSavings.py
Library      ../Locators/SaveVariableLocators.py
Variables    ../Locators/FixedDepositScreen.py
Variables    ../Locators/GoalSavings.py
Resource     CommonFunctions.robot
Library      DateTime


*** Keywords ***

open call deposit account
    sleep    7s
    Confirm user clicks the open call button, enters amount, submits
    view interest rates and the terms and conditions
    view call deposit feedback display and complete the application
    Verify user successfully selects the call account card
    check that the withdrawal rolls over the balance to an autocreated call account


Open call deposit account when there are no other save accounts
    wait until page contains element     ${SAVE_PILLAR}    75s
    click element     ${SAVE_PILLAR}
    ${Open_save_button} =    run keyword and return status
    ...    page should contain element    ${CALL_OPEN_ACCOUNT_BUTTON}   5s
    run keyword if   ${Open_save_button}   open call deposit account


click the save pillar
    wait until page contains element     ${SAVE_PILLAR}    75s
    click element     ${SAVE_PILLAR}
    sleep    30s


Verify user clicks the Open Savings Navigation
    sleep     10s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}   click element    ${OPEN_SAVINGS_ACCOUNT_NAV}


check if there are save accounts on the landing page
    swipe the app down to the bottom of the sceen
    ${other_saves} =    run keyword and return status
    ...    page should contain element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    RETURN    ${other_saves}


swipe the app down to the bottom of the sceen
    FOR    ${i}    IN RANGE    2
        swipe down dynamically
        swipe down dynamically
        swipe down dynamically
    END


Confirm user clicks the open call button, enters amount, submits
    wait until element is visible    ${CALL_OPEN_ACCOUNT_BUTTON}    30s
    click element      ${CALL_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CALL_DEPOSIT_AMOUNT_FIELD}   10s
    sleep    5s
    Input Text    ${CALL_DEPOSIT_AMOUNT_FIELD}    ${user_subsidiary["Call_opening_amount"]}
    wait until page contains element    ${CALL_CONTINUE_ACTION_BUTTON}    20s
    Click Element    ${CALL_CONTINUE_ACTION_BUTTON}

    
view interest rates and the terms and conditions
    swipe the app down to the bottom of the sceen
    Wait Until Page Contains Element    ${VIEW_INTEREST_LINK}    60S
    Click Element     ${VIEW_INTEREST_LINK}
    wait until page contains element    ${LEAVE_INTEREST_PAGE}    20s
    sleep  15s
    Click Element    ${LEAVE_INTEREST_PAGE}
    Wait Until Element Is Visible    ${TERMS_LINK}    25s
    Click Element    ${TERMS_LINK}
    Sleep    10S
    Click Element    ${LEAVE_TERMS_PAGE}
    Click Element    ${TERMS_CHECKBOX}
    wait until element is visible    ${REVIEW_CONTINUE}    15s
    Click Element    ${REVIEW_CONTINUE}
    
view call deposit feedback display and complete the application
    Wait Until Element Is Visible    ${CALL_APPLICATION_FEEDBACK}   80s
    ${feedback_text}=  Get Text    ${CALL_APPLICATION_FEEDBACK}
    Should Be Equal     ${feedback_text}    ${CALL_APPLICATION_FEEDBACK_TEXT}
    Click Element    ${APPLICATION_DONE_BUTTON}
    sleep    15s


Verify user successfully selects the call account card
     ${save_card_1}    ${save_card_2}     ${save_card_3} =    deposit account cards

     ${call_view_all1_present} =    run keyword and return status
     ...    page should contain element    ${VIEW_ALL_1}    10s


     IF    ${save_card_1}
        click element    ${SAVE_CARD_INDEX1}


     ELSE IF    ${call_view_all1_present}
        click element    ${VIEW_ALL_1}
        wait until element is visible  ${SAVE_CARD_INDEX1}    10s
        click element    ${SAVE_CARD_INDEX1}

     END


check that the call account closes if withdrawal leaves call balance with less than 50000
    click the withdraw icon & the continue button
    wait until element is visible    ${WITHDRAWAL_AMOUNT_FIELD}    15s
    input text    ${WITHDRAWAL_AMOUNT_FIELD}    ${user_subsidiary["Call_withdrawal_amount"]}
    click the continue, confirm & done buttons

check that the withdrawal rolls over the balance to an autocreated call account
    click the withdraw icon & the continue button
    wait until element is visible    ${WITHDRAWAL_AMOUNT_FIELD}    15s
    input text    ${WITHDRAWAL_AMOUNT_FIELD}    ${user_subsidiary["Call_withdrawal_amount2"]}
    click the continue, confirm & done buttons


click the withdraw icon & the continue button
    wait until page contains element    ${WITHDRAW_ICON}    20s
    sleep    5s
    click element     ${WITHDRAW_ICON}
    wait until page contains element    ${CONTINUE_WITHDRAW}    30s
    click element    ${CONTINUE_WITHDRAW}
    wait until element is visible    ${WITHDRAWAL_AMOUNT_FIELD}    15s


click the continue, confirm & done buttons
    wait until element is visible    ${CONTINUE_WITHDRAWAL}    20s
    click element    ${CONTINUE_WITHDRAWAL}
    wait until page contains element    ${CONFIRM_WITHDRAW}    20s
    click element    ${CONFIRM_WITHDRAW}
    wait until page contains element    ${CONFIRM_WITHDRAWAL}    15s
    click element    ${CONFIRM_WITHDRAWAL}
    wait until page contains element    ${WITHDRAWAL_DONE_BUTTON}    60s
    click element      ${WITHDRAWAL_DONE_BUTTON}
    sleep    15s


close the call deposit account
    sleep    15s
    Verify user successfully selects the call account card
    sleep    5s
    wait until element is visible    ${CLOSE_ACCOUNT}    20s
    click element    ${CLOSE_ACCOUNT}
    wait until element is visible    ${CONFIRM1_BUTTON}    45s
    click element     ${CONFIRM1_BUTTON}
    wait until page contains element    ${CONFIRM_CLOSURE}    50s
    click element     ${CONFIRM_CLOSURE}
    wait until page contains element    ${DONE_BUTTON}    50s
    click element    ${DONE_BUTTON}
    sleep    10s


Verify classic savings opens successfully
    #click the save pillar and swipe down
    wait until page contains element     ${SAVE_PILLAR}    75s
    click element     ${SAVE_PILLAR}
    sleep    10s
    ${Open_save_button} =    run keyword and return status
    ...    page should contain element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}   5s
    run keyword if   ${Open_save_button}   open classic account
    sleep     10s



open classic account
    click the classic open button, enter amount, submit
    confirm classic terms and conditions are attached
    verify the classic account opening completes successfully


click the classic open button, enter amount, submit
    Verify user clicks open classic button and enters amount
    wait until element is visible    ${CLASSIC_CONTINUE_ACTION_BUTTON}    7s
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}


Verify user clicks open classic button and enters amount
    Wait Until Page Contains Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}   10S
    sleep    5s
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    ${user_subsidiary["classic_opening_amount"]}



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
    sleep    15s


Check that the opened classic account card is clickable
     sleep    15s

     ${save_card_1}    ${save_card_2}     ${save_card_3} =    deposit account cards

     ${call_deposit_i_viewable}  ${classic_savings_i_viewable}    ${Fixed_deposit_i_viewable}
     ...     ${Goal_savings_i_viewable}=    save i icon is in view

     run keyword if    ${call_deposit_i_viewable}    check that the app can swipe down twice

     ${classic_view_all1_present} =    run keyword and return status
     ...    page should contain element    ${VIEW_ALL_1}    10s
     sleep    5s


     IF    "${save_card_1}" == "True" and "${classic_savings_i_viewable}" == "True"
        click element    ${SAVE_CARD_INDEX1}


     ELSE IF    "${classic_savings_i_viewable}" == "True" and "${classic_view_all1_present}" == "True"
        click element    ${VIEW_ALL_1}
        wait until element is visible  ${SAVE_CARD_INDEX1}    10s
        click element    ${SAVE_CARD_INDEX1}

     ELSE
        click element    ${SAVE_CARD_INDEX1}

     END


save i icon is in view

     ${call_deposit_i_viewable} =    run keyword and return status
     ...    page should contain element         ${CALL_DEPOSIT_I}    10s


     ${classic_savings_i_viewable} =    run keyword and return status
     ...    page should contain element         ${CLASSIC_SAVINGS_I}    10s


      ${Fixed_deposit_i_viewable} =    run keyword and return status
     ...    page should contain element         ${FIXED_DEPOSIT_I}    10s


      ${Goal_savings_i_viewable} =    run keyword and return status
     ...    page should contain element         ${GOAL_SAVINGS_I}     10s

     RETURN    ${call_deposit_i_viewable}    ${classic_savings_i_viewable}
     ...       ${Fixed_deposit_i_viewable}    ${Goal_savings_i_viewable}


confirm the manage payment icon and add recurring payment button is clicked
    sleep    5s
    wait until element is visible    ${MANAGE_PAYMENTS_ICON}    20s
    click element    ${MANAGE_PAYMENTS_ICON}
    wait until element is visible    ${ADD_RECURRING_BUTTON}     15s
    click element    ${ADD_RECURRING_BUTTON}


user click on the continue and done button to complete the transaction
    click element    ${CONTINUE}
    wait until page contains element    ${CONTINUE}    25s
    click element    ${CONTINUE}
    wait until element is visible     ${DONE_BUTTON}    45s
    click element    ${DONE_BUTTON}
    sleep    7s
    swipe down dynamically




Confirm user clicks classic open button, enters amount, submit
    sleep    15s
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    ${other_saves}    Swipe Down Dynamically
    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    click the classic open button, enter amount, submit


Confirm that user clicks on the open savings navigation and enters amount
    FOR    ${i}    IN RANGE    2
        swipe down dynamically
        swipe down dynamically
        swipe down dynamically
    END
    click element     ${OPEN_SAVINGS_ACCOUNT_NAV}
    Verify user clicks open classic button and enters amount


Check that Recurring journey is selectable
    wait until element is visible    ${RECURRING_TRANSFER_BUTTON}          50s
    click element    ${RECURRING_TRANSFER_BUTTON}
    wait until element is visible    ${CLASSIC_CONTINUE_ACTION_BUTTON}    7s
    Click Element    ${CLASSIC_CONTINUE_ACTION_BUTTON}

Verify That User Selects The Daily Frequency
    wait until element is visible    ${SELECT_FREQUENCY_DROPDOWN}          15s
    click element    ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${DAILY_PAYMENT}                       45s
    click element    ${DAILY_PAYMENT}


Verify That User Selects the Weekly Frequency
    wait until element is visible    ${SELECT_FREQUENCY_DROPDOWN}          15s
    click element    ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${WEEKLY_PAYMENT}                     45s
    click element    ${WEEKLY_PAYMENT}


Confirm the recurring amount is keyed in
    wait until page contains element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}     20s
    Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    ${user_subsidiary["classic_recurring_amount"]}
    click element    ${FIRST_PAYMENT_CALENDER}


Confirm that user enters Last payment date and completes the transaction successfully
    Confirm the end date is entered
    click element    ${CLASSIC_CONTINUE_ACTION_BUTTON}
    wait until element is visible    ${CONTINUE_BUTTON}
    click element    ${CONTINUE_BUTTON}
    confirm classic terms and conditions are attached
    verify the classic account opening completes successfully


Verify user successfully enters the start date
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
        sleep    5s
    END
    click element     ${OK_BUTTON}
    wait until element is visible    ${END_DATE_CALENDER}      15s
    click element    ${END_DATE_CALENDER}
    wait until page contains element    ${SELECTED_DATE_PEN}    20s


Check that user enters the target date, 45 days from today
    wait until element is visible    ${TARGET_DATE_CALENDER}     15s
    click element    ${TARGET_DATE_CALENDER}
    ${todays_date}    Get Current Date
    ${45_days_date_after_today}    Add Time To Date    ${todays_date}    45 days
    ${formated_45_days_date_after_today}    Convert Date    ${45_days_date_after_today}
    ...    result_format=%A, %B %-d    # use %#d if running on windows
    Log    45 days date after today is ${formated_45_days_date_after_today}

    ${date_locator}    Set Variable
    ...    //android.widget.TextView[@content-desc="${formated_45_days_date_after_today}"]
    sleep    5s
    click element    ${date_locator}
    click element     ${OK_BUTTON}


Confirm the end date is entered
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
    click element     ${OK_BUTTON}



verify user can open fixed deposit account
    click the save pillar
    ${other_saves}=    check if there are save accounts on the landing page
    run keyword if    not ${other_saves}
    ...    Open Fixed Deposit, No Preexisting Save Accounts



Open Fixed Deposit, No Preexisting Save Accounts
    click open fixed deposit button
    The Fixed deposit amount is entered and the period dropdown clicked
    Confirm Fixed Deposit Period is selected     3 Months
    Confirm The Fixed Deposit Account Opened Successfully
    validate the fixed deposit A/C info
    Confirm the interest rates document is attached


deposit account cards
    ${save_card_1} =    run keyword and return status
    ...    page should contain element    ${SAVE_CARD_INDEX1}    10s

    ${save_card_2} =    run keyword and return status
    ...    page should contain element    ${SAVE_CARD_INDEX2}    10s

    ${save_card_3} =    run keyword and return status
    ...    page should contain element    ${SAVE_CARD_INDEX3}    10s

    RETURN    ${save_card_1}    ${save_card_2}     ${save_card_3}



select the fixed deposit account card
    sleep    10s
    ${save_card_1}    ${save_card_2}
     ...    ${save_card_3} =    deposit account cards

    IF    ${save_card_1}
        click element    ${SAVE_CARD_INDEX1}

    ELSE IF    ${save_card_2}
        click element    ${SAVE_CARD_INDEX2}

    ELSE
        click element      ${SAVE_CARD_INDEX3}

    END



Confirm Fixed Deposit Period is selected
    [Arguments]    ${period}
    ${PERIOD_ELEMENT} =    Get Period Element    ${period}
    Click Element    ${PERIOD_ELEMENT}
    Log    Selected period: ${period}



Confirm The Fixed Deposit Account Opened Successfully
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
    sleep    5s
    wait until element is visible    ${FIXED_DONE_BUTTON}   80s
    Click Element    ${FIXED_DONE_BUTTON}
    sleep    5s


Confirm the back arrow is clicked if the first FD was opened
    sleep    10s
    ${first_fixed_opened} =    run keyword and return status
    ...    page should contain element    ${FIXED_DEPOSIT_TEXT}
    run keyword if    ${first_fixed_opened}
    ...    Check that user clicks the back arrow



Check that user clicks the back arrow
    wait until element is visible    ${BACK_ARROW}    10s
    click element    ${BACK_ARROW}



Verify the open account navigation is clickable
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}     20s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}


The Fixed deposit amount is entered and the period dropdown clicked
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}    7s
    Input Text    ${FIXED_AMOUNT_FIELD}     ${user_subsidiary["FIXED_AMOUNT"]}
    sleep    5s
    wait until element is visible    ${DEPOSIT_PERIOD_DROPDOWN}    7s
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s


Key in the Reinvest details
     Click Element    ${REINVEST_BUTTON}
     sleep  10s
     Swipe Down Dynamically
     Wait Until Page Contains Element    ${CHOOSE_REINVESTMENT_OPTION}   20s
     Click Element     ${CHOOSE_REINVESTMENT_OPTION}
     Wait Until Page Contains Element    ${REINVEST_PRINCIPAL_AND_INTEREST}    45s
     Click Element    ${REINVEST_PRINCIPAL_AND_INTEREST}


validate the fixed deposit A/C info
    sleep    10s
    swipe the app down to the bottom of the sceen
    sleep    3s
    select the fixed deposit account card
    Wait Until Page Contains Element    ${FIXED_ACCOUNT_INFORMATION}  20s
    sleep  10s
    Click Element    ${FIXED_ACCOUNT_INFORMATION}
    sleep    10s


Confirm the interest rates document is attached
    Click Element    ${INTEREST_RATE_INFORMATION}
    Wait Until Page Contains Element    ${LEAVE_INTEREST_RATE_PAGE}   60s
    sleep   10s
    Click Element    ${LEAVE_INTEREST_RATE_PAGE}
    Click Element    ${BACK_BUTTON}


Check User Navigates and Closes The Fixed Account
    sleep    10s
    select the fixed deposit account card
    confirm user closes the fixed deposit account


confirm user closes the fixed deposit account
    sleep    10s
    wait until element is visible      ${CLOSE_ACCOUNT_ICON}  45s
    Click Element    ${CLOSE_ACCOUNT_ICON}
    Wait Until Page Contains Element    ${CLOSE_ACCOUNT_BUTTON}  30s
    Click Element    ${CLOSE_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CONFIRM_DETAILS_BUTTON}  20s
    Click Element    ${CONFIRM_DETAILS_BUTTON}
    Wait Until Page Contains Element     ${CLOSE_ACCOUNT_BUTTON}   35s
    Click Element    ${CLOSE_ACCOUNT_BUTTON}
    Wait Until Page Contains Element      ${CLOSED_DONE_BUTTON}    45s
    Click Element    ${CLOSED_DONE_BUTTON}
    sleep    5s


click open fixed deposit button
    ${call_deposit_header_present}    ${classic_savings_header_present}
    ...    ${fixed_deposit_header_present}    ${goal_savings_header_present} =
    ...    check if specific save product headers are present

    IF    not ${call_deposit_header_present} and not ${classic_savings_header_present}
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON}

    ELSE IF    not ${call_deposit_header_present}
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON2}

    ELSE IF    not ${classic_savings_header_present}
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON2}

    ELSE
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON3}

    END



check if specific save product headers are present
    ${call_deposit_header_present} =    run keyword and return status
    ...    page should contain element    ${CALL_DEPOSIT_HEADER}    5s

    ${classic_savings_header_present} =    run keyword and return status
    ...    page should contain element    ${CLASSIC_SAVINGS_HEADER}    5s

    ${fixed_deposit_header_present} =    run keyword and return status
    ...    page should contain element    ${FIXED_DEPOSIT_HEADER}    5s

    ${goal_savings_header_present} =    run keyword and return status
    ...    page should contain element    ${GOAL_SAVINGS_HEADER}    5s

    RETURN    ${call_deposit_header_present}    ${classic_savings_header_present}
    ...    ${fixed_deposit_header_present}    ${goal_savings_header_present}





check that the open fixed deposit button is clicked
    ${fixed2_deposit_is_1st} =    run keyword and return status
    ...    wait until element is visible    ${FIXED_DP_FIRST}  30s


    ${fixed2_deposit_is_2nd} =      run keyword and return status
    ...    wait until element is visible     ${FIXED_DP_SECOND}  30s


    ${fixed3_deposit_is_3rd} =       run keyword and return status
    ...    wait until element is visible        ${FIXED_DP_THIRD}  30s



    IF    ${fixed2_deposit_is_1st}
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON}

    ELSE IF    ${fixed2_deposit_is_2nd}
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON2}

    ELSE
        click element    ${FIXED_OPEN_ACCOUNT_BUTTON3}

    END




Open goal account when there are no other save accounts
    click the save pillar
    ${no_saves} =    run keyword and return status
    ...    page should contain element    ${OPEN_GOAL_BUTTON_1}    5s

    run keyword if   ${no_saves}    Open goal savings account


Open goal Savings account
    Check that the app can swipe down twice
    Confirm user selects goal category and enters the goal name     Exams
    check the goal opening amount is keyed in
    Verify screen moves to next page upon clicking continue button
    Confirm user enters the target amount
    Verify screen moves to next page upon clicking continue button
    check that user clicks on continue and views the rates and T&Cs
    Confirm clicking the done button completes opening of the goal account
    Check that the app can swipe down twice


Close the goal account
    [Arguments]    ${goal_text}
    sleep    10s
    swipe the app down to the bottom of the sceen
    sleep    5s
    click the goal text element    ${goal_text}
    sleep    5s
    wait until element is visible    ${CLOSE_GOAL_ICON}    15s
    click element    ${CLOSE_GOAL_ICON}
    wait until element is visible    ${CLOSE_CONFIRM_BUTTON}    30s
    click element    ${CLOSE_CONFIRM_BUTTON}
    wait until element is visible    ${CONFIRM_CLOSURE_BUTTON}  30s
    click element    ${CONFIRM_CLOSURE_BUTTON}
    wait until element is visible    ${DONE_BUTTON}    70s
    click element     ${DONE_BUTTON}
    sleep    10s


Check that the app can swipe down twice
     FOR    ${i}    IN RANGE    2
        swipe down dynamically
     END



click the goal text element
    [Arguments]    ${goal_text}

    ${GOAL_CARD} =    get goal card    ${goal_text}

    ${GOAL_TEXT_ELEMENT_FOUND} =    run keyword and return status
    ...    page should contain element    ${GOAL_CARD}    7s
    IF    ${GOAL_TEXT_ELEMENT_FOUND}
        click element    ${GOAL_CARD}
    ELSE
        click element    ${VIEW_ALL_LINK}
        wait until element is visible    ${GOAL_CARD}    10s
        click element    ${GOAL_CARD}
    END


Confirm user selects goal category and enters the goal name
    [Arguments]    ${goal_text}
    sleep    5s
    ${goal_open_button_on_4th_index} =    run keyword and return status
    ...    page should contain element    ${OPEN_GOAL_BUTTON_4}

    ${goal_open_button_on_3rd_index} =    run keyword and return status
    ...    page should contain element    ${OPEN_GOAL_BUTTON_3}

    ${goal_open_button_on_2nd_index} =    run keyword and return status
    ...    page should contain element    ${OPEN_GOAL_BUTTON_2}

    ${goal_open_button_on_1st_index} =    run keyword and return status
    ...    page should contain element    ${OPEN_GOAL_BUTTON_1}


    IF    ${goal_open_button_on_4th_index}
        click element    ${OPEN_GOAL_BUTTON_4}

    ELSE IF    ${goal_open_button_on_3rd_index}
        click element    ${OPEN_GOAL_BUTTON_3}

    ELSE IF    ${goal_open_button_on_2nd_index}
        click element    ${OPEN_GOAL_BUTTON_2}

    ELSE
        click element    ${OPEN_GOAL_BUTTON_1}
    END


    wait until element is visible    ${GOAL_CATEGORY_DROPDOWN}    10s
    click element    ${GOAL_CATEGORY_DROPDOWN}
    wait until element is visible    ${EDUCATION_FUND_RADIO_BUTTON}    20s
    click element     ${EDUCATION_FUND_RADIO_BUTTON}
    input text    ${GOAL_INPUT_TEXT_FIELD}     ${goal_text}



Confirm user navigates to the open goal button
    wait until element is visible    ${OPEN_SAVINGS_ACCOUNT_NAV}    10s
    click element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    swipe down dynamically


check the goal opening amount is keyed in
    wait until element is visible    ${GOAL_CONTINUE_BUTTON}    15s
    click element    ${GOAL_CONTINUE_BUTTON}
    wait until page contains element    ${GOAL_OPENING_AMOUNT_FIELD}    20s
    input text    ${GOAL_OPENING_AMOUNT_FIELD}    ${user_subsidiary["goal_opening_amount"]}


Confirm user enters the target amount
    wait until page contains element    ${TARGET_AMOUNT_FIELD}    15s
    input text    ${TARGET_AMOUNT_FIELD}     ${user_subsidiary["goal_target_amount"]}


check that user clicks on continue and views the rates and T&Cs
    Verify user is navigated to next page upon clicking continue button
    sleep    15s
    view interest rates and the terms and conditions


Confirm clicking the done button completes opening of the goal account
    wait until element is visible    ${GOAL_DONE_BUTTON}     70s
    click element    ${GOAL_DONE_BUTTON}
    sleep    10s


Verify user is navigated to next page upon clicking continue button
    wait until element is visible     ${CONTINUE_BUTTON}    10s
    click element    ${CONTINUE_BUTTON}


Verify screen moves to next page upon clicking continue button
    wait until element is visible     ${NEXT_CONTINUE_BUTTON}    10s
    click element    ${NEXT_CONTINUE_BUTTON}


Confirm user clicks the recurring button, enters amount and clicks frequency dropdown
    ${Add_reccurring_button} =    run keyword and return status
    ...    page should contain element     ${ACTIVATE_RECURRING_BUTTON}
    IF     ${Add_reccurring_button}
        click element    ${ACTIVATE_RECURRING_BUTTON}
    ELSE
        click element    ${ADD_RECURRING_PAYMENT_BUTTON}
    END
    ${recurring_button_present} =   run keyword and return status
    ...    wait until element is visible    ${RECURRING_CONTINUE_BUTTON}    10s
    run keyword if    ${recurring_button_present}    click element
    ...    ${RECURRING_CONTINUE_BUTTON}
    Confirm user enters the target amount
    wait until page contains element    ${SELECT_FREQUENCY_DROPDOWN}    15s
    click element     ${SELECT_FREQUENCY_DROPDOWN}
    wait until element is visible    ${DAILY_PAYMENT_OPTION}     70s
    click element    ${DAILY_PAYMENT_OPTION}
    wait until page contains element    ${START_DATE_CALENDER}    10s
    click element     ${START_DATE_CALENDER}


confirm the contiue button is clicked
    wait until element is visible    ${RECURRING_CONTINUE_BUTTON}    10s
    click element    ${RECURRING_CONTINUE_BUTTON}


Check screen navigates after confirm and edit buttons are clicked
    wait until page contains element    ${RECURRING_PAYMENT_CONFIRM_BUTTON}    30s
    click element    ${RECURRING_PAYMENT_CONFIRM_BUTTON}
    wait until page contains element    ${YES_SURE_BUTTON}    45s
    click element    ${YES_SURE_BUTTON}
    wait until element is visible    ${MANUAL_PAYMENT_EDIT_DONE_BUTTON}    80s
    click element    ${MANUAL_PAYMENT_EDIT_DONE_BUTTON}


check that user can click the goal card and the manage payments icon
    [Arguments]    ${goal_text}
    sleep    10s
    click the goal text element    ${goal_text}
    sleep    10s
    wait until element is visible    ${GOAL_MANAGE_PAYMENTS_BUTTON}     20s
    click element    ${GOAL_MANAGE_PAYMENTS_BUTTON}
    wait until element is visible    ${MANUAL_TOP_UP_TEXT}      15s















