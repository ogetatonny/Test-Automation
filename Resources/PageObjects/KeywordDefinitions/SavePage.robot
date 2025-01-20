*** Settings ***
Library    AppiumLibrary
Variables    ../Locators/CallDepositScreen.py
Variables    ../Locators/ClassicSavings.py
Variables    ../Locators/FixedDepositScreen.py



*** Variables ***
${START_Y}    80  # Start point as percentage of screen height
${END_Y}      20  # End point as percentage of screen height
${X_COORD}    50  # X coordinate as percentage of screen width

*** Keywords ***

Navigate to the save page select call deposit and enter amount
    [Arguments]    ${CALL_AMOUNT}
    Click Element    ${SAVE_PILLAR}
    Wait Until Page Contains Element    ${CALL_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CALL_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CALL_DEPOSIT_AMOUNT_FIELD}   10S
    Input Text    ${CALL_DEPOSIT_AMOUNT_FIELD}    ${CALL_AMOUNT}
    Click Element    ${CALL_CONTINUE_ACTION_BUTTON}
    
view call interest rates and the terms and conditions
    Wait Until Page Contains Element    ${VIEW_INTEREST_LINK}    7s
    Click Element     ${VIEW_INTEREST_LINK}
    Wait Until Element Is Visible    ${LEAVE_INTEREST_PAGE}    10s
    sleep  5s
    Click Element    ${LEAVE_INTEREST_PAGE}
    Wait Until Element Is Visible    ${CALL_TERMS_LINK}    7s
    Click Element    ${CALL_TERMS_LINK}
    Sleep    10S
    Click Element    ${LEAVE_TERMS_PAGE}
    Click Element    ${CALL_TERMS_CHECKBOX}
    Click Element    ${CALL_CONFIRM_BUTTON}
    
view call deposit feedback display and complete the application
    Wait Until Element Is Visible    ${CALL_APPLICATION_FEEDBACK}   60s
    ${feedback_text}=  Get Text    ${CALL_APPLICATION_FEEDBACK}
    Should Be Equal     ${feedback_text}    ${CALL_APPLICATION_FEEDBACK_TEXT}
    Click Element    ${APPLICATION_DONE_BUTTON}
    
Navigate to the save page select classic savings and enter amount
    [Arguments]    ${CLASSIC_AMOUNT}
    Click Element    ${SAVE_PILLAR}
    sleep  20s
    Wait Until Keyword Succeeds    10s    1s    check if No savings account error is available on the screen
    Wait Until Page Contains Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}    10s
    Click Element    ${CLASSIC_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CLASSIC_SAVINGS_AMOUNT_FIELD}   10S
    #Input Text    ${CLASSIC_SAVINGS_AMOUNT_FIELD}    ${CLASSIC_AMOUNT}
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
    ${other_savings_account_available}=    Run Keyword And Return Status    Open classic Savings account when no other savings accounts had been opened
    Run Keyword If    not ${other_savings_account_available}   open another classic account if there is a preexisting one
    
open another classic account if there is a preexisting one
    ${save_navigation}=   Run Keyword And Return Status    Navigate to the save page select classic savings and enter amount  600000
    Run Keyword If    not ${save_navigation}    move from the save pillar to opening of the save account(classic)
    
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


Open Fixed Deposit Account When There Are No Preexisting Savings Accounts
    [Arguments]    ${FIXED_AMOUNT}
    Click Element    ${SAVE_PILLAR}
    Sleep   15s
    Wait Until Keyword Succeeds    10s    1s    check if No savings account error is available on the screen
    Wait Until Element Is Visible    ${FIXED_OPEN_ACCOUNT_BUTTON}  15s
    Click Element    ${FIXED_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s
    Fixed Deposit Period    3 Months
    complete opening of the fixed deposit account

Fixed Deposit Period
    [Arguments]    ${period}
    ${PERIOD_ELEMENT}=    Set Variable    //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text="${period}"]
    Click Element    ${PERIOD_ELEMENT}
    Log    Selected period: ${period}
    
check if No savings account error is available on the screen
    ${no_savings_account}=   Run Keyword And Return Status    Page Should Not Contain Element     ${NO_SAVINGS_DISPLAY}
    Run Keyword If   not ${no_savings_account}    wait until the No savings error display appears on the screen

wait until the No savings error display appears on the screen
    Wait Until Element Is Visible    ${NO_SAVINGS_DISPLAY}   10S
    Wait Until Page Contains Element    ${NO_SAVINGS_DISMISS_BUTTON}  7s
    Click Element    ${NO_SAVINGS_DISMISS_BUTTON}

complete opening of the fixed deposit account
    Wait Until Element Is Visible    ${FIXED_CONTINUE_BUTTON}   60s
    Click Element    ${FIXED_CONTINUE_BUTTON}
    Wait Until Page Contains Element    ${FIXED_DEPOSIT_CONFIRMATION}  10S
    Wait Until Element Is Visible    ${FIXED_TERMS_LINK}  7S
    Click Element    ${FIXED_TERMS_LINK}
    Wait Until Page Contains Element    ${FIXED_TERMS_PAGE}  10s
    sleep  8s
    Click Element    ${FIXED_TERMS_EXIT}
    Click Element    ${FIXED_TERMS_CHECKBOX}
    Click Element    ${FIXED_CONFIRM_BUTTON}
    Wait Until Page Contains    ${FIXED_SUCCESS_TEXT}  45s
    Click Element    ${FIXED_DONE_BUTTON}
    Wait Until Element Is Visible    ${CREATED_FIXED_CARD}   30s
    
Open fixed deposit account
    ${Others_available} =    Run Keyword And Return Status    Open Fixed Deposit Account When There Are No Preexisting Savings Accounts   15000000
    Run Keyword If    not ${Others_available}    Open fixed deposit account if there are preexisting save accounts  12000000

Open fixed deposit account if there are preexisting save accounts
    [Arguments]    ${FIXED_AMOUNT}
    swipe down dynamically if the open save account button not visible
    Wait Until Element Is Visible    ${OPEN_SAVINGS_ACCOUNT_NAV}  10s
    Click Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Wait Until Keyword Succeeds    10s    1s    check if No savings account error is available on the screen
    Wait Until Element Is Visible    ${FIXED_OPEN_ACCOUNT_BUTTON}  15s
    Click Element    ${FIXED_OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${FIXED_AMOUNT_FIELD}
    Input Text    ${FIXED_AMOUNT_FIELD}    ${FIXED_AMOUNT}
    Click Element   ${DEPOSIT_PERIOD_DROPDOWN}
    Wait Until Page Contains Element    ${DEPOSIT_PERIOD_EXIT}   10s
    sleep  10s
    Fixed Deposit Period    3 Months
    complete opening of the fixed deposit account

Swipe Down Dynamically
    ${screen_width}    Get Window Width
    ${screen_height}   Get Window Height
    ${start_x}    Evaluate    ${screen_width} * ${X_COORD} / 100
    ${start_y}    Evaluate    ${screen_height} * ${START_Y} / 100
    ${end_y}      Evaluate    ${screen_height} * ${END_Y} / 100
    Swipe    ${start_x}    ${start_y}    ${start_x}    ${end_y}    1000

swipe down dynamically if the open save account button not visible
    ${is_save_open_button_visible}=    Run Keyword And Return Status    Page Should Contain Element    ${OPEN_SAVINGS_ACCOUNT_NAV}
    Run Keyword If    not ${is_save_open_button_visible}     Swipe Down Dynamically

swipe up dynamically
    ${screen_width}    Get Window Width
    ${screen_height}   Get Window Height
    ${start_x}    Evaluate    ${screen_width} * ${X_COORD} / 100
    ${start_y}    Evaluate    ${screen_height} * ${START_Y} / 100
    ${end_y}      Evaluate    ${screen_height} * ${END_Y} / 100
    Swipe    ${start_x}    ${end_y}    ${start_x}    ${start_y}    1000

