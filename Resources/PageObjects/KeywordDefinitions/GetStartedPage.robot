*** Settings ***
Library         AppiumLibrary
Variables       ../Locators/GetStartedScreen.py


*** Keywords ***
Validate Equity Logo Is Present
    [Documentation]              Validation of Equity Logo

Navigate To Login Page
    [Documentation]    Navigate to the login Page
    Click Button       ${GET_STARTED_BUTTON}
    Click Button       ${GET_STARTED_BUTTON}