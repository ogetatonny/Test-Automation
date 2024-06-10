*** Settings ***
Documentation       Transactions Tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/SendMoney.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown


*** Test Cases ***
#Send MONEY IN MINUTES-Western Union Internationally to Bank
#	[Tags]   KE
#    Click on Transact Menu
#    Click on Western Union
#    Send Money-Western Union Internationally to Bank    Send money    United Arab   MONEY IN MINUTES    Fname   Mname   Lname    Bondo


Send MONEY DIRECT TO BANK-Western Union Internationally to Bank
	[Tags]   KE
    Click on Transact Menu
    Click on Western Union
    Send Money-Western Union Internationally to Direct to bank    Send money    United Arab   DIRECT TO BANK    Fname   Mname   Lname   BankName    BIC   IBAN    Bondo

