*** Settings ***
Library    AppiumLibrary
Variables    ../Locators/OneMonthLoan.py
Resource    SavePage.robot
Library    String
Library    Collections

*** Keywords ***

check if unqualified user gets the right error message
    [Documentation]    to check that the unqualified user gets the correct error display
    
    Check the Loan Limit
    sleep   10s
    Run Keyword And Return Status   Extract the full loan limit from the loan limit dialog
    ${unqualified_user}=            Run Keyword And Return Status    check unqualified user through learn more
    Run Keyword If                  not ${unqualified_user}    click element    ${APPLY_NOW_BUTTON}

confirm the loan products page
    ${products_text}=    Get Text        ${LOAN_PRODUCTS_TEXT}
    Should Be Equal                      ${products_text}    Equity offers a variety of loans to help you meet your goals. Look through our loan products to find one that is suited to your needs.
    
Learn more-one month details UG
    Wait Until Page Contains Element     ${LEARN_MORE}    20S
    Click Element                        ${LEARN_MORE}
    #${one_month_details}=    Get Text    ${ONE_MONTH_MORE_ELEMENT}
    #Should Be Equal    ${one_month_details}   ${ONE_MONTH_MORE_TEXT}
    Wait Until Page Contains Element     ${CHECK_LOAN_LIMIT}    10s
    Click Element                        ${CHECK_LOAN_LIMIT}
    ${unqualified_user}=    Run Keyword And Return Status    check unqualified user through learn more
    Run Keyword If          not ${unqualified_user}    click element            ${APPLY_NOW_BUTTON}

check unqualified user through learn more
    Wait Until Page Contains Element     ${ESCAPE_UNQUALIFIED_USER_ERROR}        30s
    ${one_month_unqualified_text}=  Get Text   ${UNQUALIFIED_USER_INFO}
    Should Be Equal                      ${one_month_unqualified_text}           ${UNQUALIFIED_USER_TEXT}
    click element                        ${ESCAPE_UNQUALIFIED_USER_ERROR}

Apply Partially For Qualified User
    Enter the loan amount
    sleep    7s
    Select Loan Purpose, Check the Loan terms, Accept The Loan Terms And Submit The Loan For Review
    check Application review And Enter OTP

Select Loan Purpose, Check the Loan terms, Accept The Loan Terms And Submit The Loan For Review
    Click Element                      ${PURPOSE_SELECTION}
    sleep  7s
    Click Element                       ${ACTUAL_PURPOSE}
    Click Element                       ${CONTINUE_BUTTON}
    Click Element                       ${APPLY_FOR_LOAN_BUTTON}
    Wait Until Page Contains Element    ${LOAN_TERMS_LINK}        10S
    confirm the loan terms and conditions
    Wait Until Element Is Visible       ${TERMS_CHECKBOX}         20s
    Click Element                       ${TERMS_CHECKBOX}
    Click Element                       ${CONFIRM_LOAN_BUTTON}
    

Enter the loan amount
    ${amount}=    Set borrow amount based on the tag
    Input Text    ${BORROW_AMOUNT_FIELD}    ${amount}

Set borrow amount based on the tag
    ${amount}=    Run Keyword If    'UG' in ${TEST TAGS}    Set Variable    10000000
    ...       ELSE IF        'TZ' in ${TEST TAGS}           Set Variable    5000000
    ...       ELSE IF        'KE' in ${TEST TAGS}           Set Variable    18000000
    ...       ELSE IF        'RW' in ${TEST TAGS}           Set Variable    15000000
    ...       ELSE IF        'SS' in ${TEST TAGS}           Set Variable    17000000
    [Return]                 ${amount}

confirm the loan terms and conditions
    Click Element                              ${LOAN_TERMS_LINK}
    Wait Until Page Contains Element           ${TERMS_PAGE_TITLE}       30s
    sleep    10s
    Wait Until Element Is Visible              ${CLOSE_TERMS_BUTTON}
    Click Element                              ${CLOSE_TERMS_BUTTON}

check Application review And Enter OTP
    Enter OTP
    Wait Until Page Contains Element          ${REVIEW_CONFIRMATION}    20s
    sleep   10s
    #${review_display}=    Get Text    ${TEXT_ELEMENT}
    #Should Be Equal   ${review_display}    ${REVIEW_TEXT}
    Click Element                            ${DONE_REVIEW}


Enter OTP
    Wait Until Page Contains Element    ${OTP_HEADER}   10s
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit1"]    1
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit2"]    2
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit3"]    3
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit4"]    4
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit5"]    5
    Input Text    //android.widget.EditText[@resource-id="ke.co.equitygroup.equitymobile.debug:id/digit6"]    6

Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed
    Navigate to the Homepage from borrow page and click the borrow icon at the homepage
    sleep  10s
    ${Loan_card_is_available} =  Run Keyword And Return Status    Page Should Contain Element     ${EAZZYLOAN_CARD}
    Run Keyword If               not ${Loan_card_is_available}    Navigate to the Homepage from borrow page and click the borrow icon at the homepage

Navigate to the Homepage from borrow page and click the borrow icon at the homepage
    Navigate To The HomePage from the BorrowPage
    Click Element                        ${BORROW_ICON}

Navigate To The HomePage from the BorrowPage
    Click Element                        ${BACK_ARROW_FROM_BORROW}
    Wait Until Element Is Visible        ${BORROW_ICON}  15s
    sleep  10s
    swipe up dynamically 
    sleep   10s
    
Top up with the Remaining Loan Amount
    ${successful_initial application}=  Run Keyword And Return Status        Apply Partially For Qualified User
    Run Keyword If                      ${successful_initial application}    Wait Until Page Contains Element    ${APPLY_ONE_MONTH_NAV}   10s
    sleep   5s
    Click Element               ${APPLY_ONE_MONTH_NAV}
    Learn more-one month details UG
    Top up the one month loan with the remaining one month Limit

Top up the one month loan with the remaining one month Limit
    Enter the remaining loan amount
    sleep    7s
    Select Loan Purpose, Check the Loan terms, Accept The Loan Terms And Submit The Loan For Review
    check Application review And Enter OTP

Enter the remaining loan amount
    ${remaining_amount}=      Set the remaining borrow amount based on the tag
    Input Text               ${BORROW_AMOUNT_FIELD}    ${remaining_amount}

Set the remaining borrow amount based on the tag
    ${remaining_amount}=   Run Keyword If    'UG' in ${TEST TAGS}    Set Variable    9000000
    ...       ELSE IF        'TZ' in ${TEST TAGS}        Set Variable                5000000
    ...       ELSE IF        'KE' in ${TEST TAGS}        Set Variable                18000000
    ...       ELSE IF        'RW' in ${TEST TAGS}        Set Variable                15000000
    ...       ELSE IF        'SS' in ${TEST TAGS}        Set Variable                17000000
    [Return]    ${remaining_amount}

Pay the one month loan partially
    Navigate To the BorrowPage And Check If The Applied Loan Has Been Disbursed
    Click the loan action, make payment button and select the loan to pay
    Click Element                                    ${SELECT_LOAN_AMOUNT}
    Wait Until Page Contains Element                 ${SELECT_PARTIAL_AMOUNT}     10s
    Click Element                                    ${SELECT_PARTIAL_AMOUNT}
    Enter the partial amount to pay
    click the continue button, confirm the charges and submit the loan application
    Sleep    10s
    Navigate to the Homepage from borrow page and click the borrow icon at the homepage
    sleep  15s

Amount paid and the charges on the confirmation screen
    ${paid_amount} =          Get Text             ${PAID_AMOUNT_ON_CONFIRMATION_SCREEN}
    Log To Console            Loan paid amount is: ${paid_amount}
    ${paid_charges} =         Get Text             ${LOAN_CHARGES}
    Log To Console            Charges for the loan: ${paid_charges}
    
Enter the partial amount to pay
    ${partial_amount} =       Set the partial amount based on the tag
    Input Text                ${PARTIAL_AMOUNT_FIELD}    ${partial_amount}
    
Set the partial amount based on the tag
    ${partial amount} =  Run Keyword If    'UG' in ${TEST TAGS}        Set Variable    10000000
    ...                  ELSE IF           'TZ' in ${TEST TAGS}        Set Variable     5000000
    ...                  ELSE IF           'KE' in ${TEST TAGS}        Set Variable     18000000
    ...                  ELSE IF           'RW' in ${TEST TAGS}        Set Variable     15000000 
    ...                  ELSE IF           'SS' in ${TEST TAGS}        Set Variable     17000000
    [Return]            ${partial amount}

Pay all the one month loan amount that is on the user profile
    ${loan_action_is available} =         Run Keyword And Return Status    Page Should Contain Element    ${LOAN_ACTION}
    Run Keyword If                        not ${loan_action_is available}  Click Element    ${BORROW_ICON}
    sleep  15s
    Click the loan action, make payment button and select the loan to pay
    Click Element                         ${SELECT_LOAN_AMOUNT}
    Wait Until Page Contains Element      ${FULL_AMOUNT_RADIO_BUTTON}   5s
    Click Element                         ${FULL_AMOUNT_RADIO_BUTTON}
    click the continue button, confirm the charges and submit the loan application
    Sleep    10s
    Navigate to the Homepage from borrow page and click the borrow icon at the homepage
    sleep  15s
    
Click the loan action, make payment button and select the loan to pay
    Click Element                        ${LOAN_ACTION}
    Wait Until Element Is Visible        ${MAKE_PAYMENT_BUTTON}     10s
    Click Element                        ${MAKE_PAYMENT_BUTTON}
    Wait Until Element Is Visible        ${SELECT_LOAN_TO_PAY}      10s
    Click Element                        ${SELECT_LOAN_TO_PAY}
    Wait Until Page Contains Element     ${SELECT_THE_LOAN}         15s
    Click Element                        ${SELECT_THE_LOAN}
    
click the continue button, confirm the charges and submit the loan application
    Wait Until Page Contains Element    ${CONTINUE_ACTION_BUTTON}   30s
    Click Element                       ${CONTINUE_ACTION_BUTTON}
    Wait Until Page Contains Element    ${CONTINUE_ACTION_BUTTON}   30s
    Click Element                       ${CONTINUE_ACTION_BUTTON}
    Amount paid and the charges on the confirmation screen
    Wait Until Page Contains Element    ${PAY_LOAN_BUTTON}          10s
    Click Element                       ${PAY_LOAN_BUTTON}
    sleep  10s
    Click Element                       ${DONE_REVIEW}

Pay the remaining one month loan amount
    Pay all the one month loan amount that is on the user profile

Apply for the full amount
    Check the Loan Limit
    Extract the Full Loan Limit from the Loan Limit Dialog and key it in as the full loan amount
    Select Loan Purpose, Check the Loan terms, Accept The Loan Terms And Submit The Loan For Review
    check Application review And Enter OTP

Extract the Full Loan Limit from the Loan Limit Dialog and key it in as the full loan amount
    [Documentation]    Extract the loan limit from the loan dialog and return it as a clean integer value (without commas or decimal places).

    # Get the text from the loan limit dialog
    ${loan_text}=     Get Text            ${FULL_AMOUNT_LOCATOR}
    Log               Captured Loan Text: ${loan_text}
    
    # Clean the captured text
    ${loan_text}=    Replace String        ${loan_text}    \xa0    " "    # Replace non-breaking spaces
    ${loan_text}=    Strip String          ${loan_text}                   # Remove leading/trailing spaces
    Log               Cleaned Loan Text:   ${loan_text}
    
    # Use regex to capture the loan limit with commas
    ${matches}=    Get Regexp Matches      ${loan_text}    \\d{1,3}(?:,\\d{3})*
    Log    Regex Matches (Loan Limit with Commas): ${matches}
    
    #Fail if no matches are found
    Run Keyword If    ${matches} == []    Fail    No integer loan limit found in the text: ${loan_text}
    
    # Extract the first match
    ${loan_limit_with_commas}=    Get From List    ${matches}    0
    Log                Loan Limit with Commas:     ${loan_limit_with_commas}
    
    # Use Python to remove commas and decimals
    ${loan_limit_cleaned}=  Evaluate    ''.join([char for char in '${loan_limit_with_commas}' if char.isdigit()])    # Remove commas and decimal places
    Log                Cleaned Loan Limit (Integer Only): ${loan_limit_cleaned}
    Click Element                           ${APPLY_NOW_BUTTON}
    
   # Wait for the next page to load
    Wait Until Page Contains Element        ${BORROW_AMOUNT_FIELD}           20s
    Input Text                              ${BORROW_AMOUNT_FIELD}           ${loan_limit_cleaned}
    # Return the clean loan limit (integer only)
    [Return]                                ${loan_limit_cleaned}

Check the Loan Limit
    Wait Until Element Is Visible           ${BORROW_ICON}
    Click Element                           ${BORROW_ICON}
    Wait Until Page Contains Element        ${APPLY_ONE_MONTH_NAV}           10S
    Click Element                           ${APPLY_ONE_MONTH_NAV}
    sleep    5s
    confirm the loan products page
    Wait Until Page Contains Element        ${LEARN_MORE}                    20S
    Click Element                           ${LEARN_MORE}
    Click Element                           ${CHECK_LOAN_LIMIT}
    Wait Until Page Contains Element        ${APPLY_NOW_BUTTON}              30s
    





