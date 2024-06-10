*** Settings ***
Documentation       Intercountry Transactions Tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/SendMoney.robot
Suite Setup        Start Equity Application
#Suite Teardown     Suite Teardown

*** Test Cases ***
Send Money to UGX Successfully
	[Tags]    KE   RW   TZ   SS
	Click on Transact Menu
	Click Send Money to Another Equity account Menu
	Send Money to  ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_EQUITY_ACCOUNT"]}

Send Money to TZS Successfully
	[Tags]    KE   RW   UG   SS
	Click on Transact Menu
	Click Send Money to Another Equity account Menu
	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_EQUITY_ACCOUNT"]}

#Send Money RWF Successfully
#	[Tags]    KE   TZ   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_EQUITY_ACCOUNT"]}

#Send Money to KE Successfully
#	[Tags]    SS   TZ   UG   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_EQUITY_ACCOUNT"]}

#Send Money to SS Successfully
#	[Tags]    KE   TZ   UG   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_EQUITY_ACCOUNT"]}




#Send Money to USD-UG Successfully
#	[Tags]    SS   TZ   KE   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_USD_ACCOUNT"]}

#Send Money to USD-TZ Successfully
#	[Tags]    SS   UG   KE   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}   ${user_subsidiary["INTER_COUNTRY"]["TZ_USD_ACCOUNT"]}

#Send Money to USD-RW Successfully
#	[Tags]    SS   UG   KE   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_USD_ACCOUNT"]}

#Send Money to USD-SS Successfully
#	[Tags]    RW   UG   KE   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_USD_ACCOUNT"]}

#Send Money to USD-KE Successfully
#	[Tags]    RW   UG   SS   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}   ${user_subsidiary["INTER_COUNTRY"]["KE_USD_ACCOUNT"]}



#Send Money from USD to KE Successfully
#	[Tags]    RW   UG   SS   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to    ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}      ${user_subsidiary["INTER_COUNTRY"]["KE_EQUITY_ACCOUNT"]}

#Send Money from USD to TZ Successfully
#	[Tags]    RW   UG   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to    ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}      ${user_subsidiary["INTER_COUNTRY"]["TZ_EQUITY_ACCOUNT"]}

#Send Money from USD to RW Successfully
#	[Tags]    TZ   UG   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to   ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}      ${user_subsidiary["INTER_COUNTRY"]["RW_EQUITY_ACCOUNT"]}

#Send Money from USD to UG Successfully
#   [Tags]    TZ   RW   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to    ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}      ${user_subsidiary["INTER_COUNTRY"]["UG_EQUITY_ACCOUNT"]}

#Send Money from USD to SS Successfully
#   [Tags]    TZ   RW   UG   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to     ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}      ${user_subsidiary["INTER_COUNTRY"]["SS_EQUITY_ACCOUNT"]}



#
#Send Money from USD to KE-USD Successfully
#	[Tags]    TZ   RW   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to USD    ${user_subsidiary["DESTINATION_COUNTRY"]["KE"]}     ${user_subsidiary["INTER_COUNTRY"]["KE_USD_ACCOUNT"]}

Send Money from USD to TZ-USD Successfully
	[Tags]    KE   RW   UG   SS
	Click on Transact Menu
	Click Send Money to Another Equity account Menu
	Send Money from USD to USD    ${user_subsidiary["DESTINATION_COUNTRY"]["TZ"]}    ${user_subsidiary["INTER_COUNTRY"]["TZ_USD_ACCOUNT"]}

#Send Money from USD to RW-USD Successfully
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to USD  ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}   ${user_subsidiary["INTER_COUNTRY"]["RW_USD_ACCOUNT"]}
#
#Send Money from USD to UG-USD Successfully
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["UG"]}   ${user_subsidiary["INTER_COUNTRY"]["UG_USD_ACCOUNT"]}
#
#Send Money from USD to SS-USD Successfully
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD to USD   ${user_subsidiary["DESTINATION_COUNTRY"]["SS"]}   ${user_subsidiary["INTER_COUNTRY"]["SS_USD_ACCOUNT"]}