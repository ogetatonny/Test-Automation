*** Settings ***
Library      AppiumLibrary
Library      Screenshot    default_directory=../Screenshots
Resource     ../../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Resource     ../../Resources/PageObjects/KeywordDefinitions/SavePage.robot
Suite Setup   Initial App Launch and Nav to Homepage


*** Test Cases ***
Open fixed deposit when no other save product is opened
    [Tags]    KE  UG  RW  TZ
    [Documentation]   No Reinvesting- Open
    verify user can open fixed deposit account

Open And Close Fixed Deposit
    [Tags]    KE  UG  RW  TZ
    [Documentation]    No reinvesting - Open & close
    Confirm the back arrow is clicked if the first FD was opened
    check if there are save accounts on the landing page
    Verify the open account navigation is clickable
    #click open fixed deposit button
    check that the open fixed deposit button is clicked
    The Fixed deposit amount is entered and the period dropdown clicked
    Confirm Fixed Deposit Period is selected     3 Months
    Confirm The Fixed Deposit Account Opened Successfully
    swipe the app down to the bottom of the sceen
    Check User Navigates and Closes The Fixed Account


Open fixed deposit when other save products are opened
    [Tags]    KE  UG  RW  TZ
    [Documentation]    Reinvesting - Open & close
    Check that the app can swipe down twice
    Verify the open account navigation is clickable
    #click open fixed deposit button
    check that the open fixed deposit button is clicked
    The Fixed deposit amount is entered and the period dropdown clicked
    Confirm Fixed Deposit Period is selected     6 Months
    Key in the Reinvest details
    Confirm The Fixed Deposit Account Opened Successfully
    validate the fixed deposit A/C info
    Confirm the interest rates document is attached
    confirm user closes the fixed deposit account
    Check that the app can swipe down twice



