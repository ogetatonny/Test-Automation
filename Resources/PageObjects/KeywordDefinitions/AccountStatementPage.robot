*** Settings ***
Library    AppiumLibrary
Library    String
Library    Collections
Variables       ../Locators/AccountMenuScreen.py
Variables       ../Locators/HomeScreen.py
Resource    ../KeywordDefinitions/CommonFunctions.robot

*** Variables ***
@{STATEMENT_DURATIONS}    	1 Month    3 Months   6 Months  12 Months   1 Years

*** Keywords ***
Click on View Statement Link
	Wait Until Element Is Ready And Click        ${VIEW_STATEMENT_LINK}
	Verify Screen Title  ${SCREEN_TITLE_TEXT}    View your statement

Call Duration Lists
    [Documentation]    Call Duration Lists
    [Arguments]        @{STATEMENT_DURATIONS}
    FOR    ${STATEMENT_DURATIONS}    IN    @{STATEMENT_DURATIONS}
        Click Statement Duration           ${STATEMENT_DURATIONS}
    END

Click Statement Duration
    [Documentation]    Click Statement Duration
    [Arguments]      ${STATEMENT_DURATIONS}
    Wait Until Element Is Ready And Click        //androidx.recyclerview.widget.RecyclerView/android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/suggestionChip" and @text="${STATEMENT_DURATIONS}"]

Click 2-Years Statement Duration
    [Arguments]      ${STATEMENT_DURATIONS}
    Scroll Element Into View  //androidx.recyclerview.widget.RecyclerView/android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/suggestionChip" and @text="${STATEMENT_DURATIONS}"]
    Wait Until Element Is Ready And Click        //androidx.recyclerview.widget.RecyclerView/android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/suggestionChip" and @text="${STATEMENT_DURATIONS}"]

Select Preferred Statement Duration
	Click Element       ${SELECT_DURATION_START_DATE}
	Wait Until Element Is Ready And Click        ${NAVIGATE_TO_PREVIOUS_MONTH_BUTTON}
	Click Element       ${SELECT_DAY_OF_MONTH}
	Click Element       ${OK_BUTTON}

Click on the View Button
	Click Element    ${VIEW_BUTTON}
	Verify Screen Title   ${SCREEN_TITLE_TEXT}    View statement

Click on the Share Menu
	Wait Until Element Is Ready And Click        ${SHARE_MENU}

Verify Download and Share Modal Displayed
	Wait Until Element Is Visible    ${SHARE_HEADER_TITLE}
	${SHARE_HEADER_TITLE_MESSAGE}=  Get Text            ${SHARE_HEADER_TITLE}
	Should Contain   ${SHARE_HEADER_TITLE_MESSAGE}        Download and share

Share Statement
	Verify Download and Share Modal Displayed
	Wait Until Element Is Ready And Click        ${SHARE_DOCUMENT_MENU}
	Sleep    3sec
	Click Element    ${NAVIGATE_BACK_TO_DS_VIEW}
	Sleep    10s
	Wait Until Element Is Ready And Click        ${CLOSE_MODAL_BUTTON}
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}
	Sleep    2s

Navigate back to home screen
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}
	Verify Screen Title    ${MAIN_TITLE}        Home

Send Statement to Email
	Verify Download and Share Modal Displayed
	Click Element    ${SEND_TO_AN_EMAIL_ADDRESS_MENU}
	Verify that the Email is Sent
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}

Verify that the Email is Sent
	Wait Until Keyword Succeeds    1min     1sec    Element Should Be Visible     ${ERROR_DESCRIPTION}
	${SUCCESS_MESSAGE_DESCRIPTION}   Get Text            ${ERROR_DESCRIPTION}
	Should Contain   ${SUCCESS_MESSAGE_DESCRIPTION}        We have sent statement to
	${SUCCESS_MESSAGE}=  Get Text            ${ERROR_TITLE}
	Should Contain   ${SUCCESS_MESSAGE}        You've got mail!
	Wait Until Element Is Ready And Click        ${DISMISS_BUTTON}

Download Statement to Phone
	Verify Download and Share Modal Displayed
	Click Element    ${DOWNLOAD_AND_SAVE_TO_PHONE_MENU}
	Wait Until Element Is Visible    ${DOWNLOAD_VIA_ACROBAT_ICON}
	${ACROBAT_MESSAGE}  Get Text            ${DOWNLOAD_VIA_ACROBAT_ICON}
	Should Contain   ${ACROBAT_MESSAGE}        	Adobe Acrobat
	Click Element    ${NAVIGATE_BACK_TO_DS_VIEW}
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}


Move Back to the Previous Screen
	Click Back Arrow        ${NAVIGATE_BACK_FROM_PDF_BUTTON}




