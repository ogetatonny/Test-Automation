*** Settings ***
Documentation  Verify That User can successfully Withdraw from an Agent
Library   AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/CommonFunctions.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown



*** Test Cases ***