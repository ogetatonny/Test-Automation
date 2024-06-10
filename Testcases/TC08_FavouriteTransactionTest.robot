*** Settings ***
Documentation       Transactions Tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../Resources/PageObjects/KeywordDefinitions/SendMoney.robot
Suite Setup        Start Equity Application
Suite Teardown     Suite Teardown


*** Test Cases ***
#User cannot save a favourite when sending to own account
#	[Documentation]    User cannot save a favourite when sending to own account
#	[Tags]    KE
#	Click on Transact Menu
#	Click Send Money to Own Equity Account Menu
#	Send Money To Own Equity Account
#
#User cannot save a favourite when sending to own account
#	[Documentation]    User cannot save a favourite when sending to own account
#	[Tags]   RW   UG   TZ  SS
#	Click on Transact Menu
#	Click Send Money to Own Equity Account Menu
#	Send Money To Own Equity Account For Favourite
#

#Send Money To Another Favourite Equity Account
#	[Documentation]    Send Money To Another Favourite Equity Account
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money To Favourite Equity Account/Number         ${user_subsidiary["intra_destination_account"]}

#Send Money to Another Favourite Bank Account
#	[Documentation]    Send Money to Another Favourite Bank Account
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on Transact Menu
#	Click Send Money to Another Bank Menu
#	Send Money To Another Bank Favourite      ${user_subsidiary["another_Bank_destination_account"]}

#Send Money To Favourite Phone-Linked
#	[Documentation]    Send Money To Favourite Phone-Linked
#	[Tags]    KE   RW   UG   TZ  SS
#	Click on Transact Menu
#    Click Send Money to Another Bank Menu
#    Send Money To Phone-Linked Favourite     ${user_subsidiary["PESALINK_NUMBER"]}

Send Money To Favourite Airtel Money Number
	[Documentation]    Send Money To Favourite Airtel Money Number
	[Tags]    KE   RW   UG   TZ  SS
    Click on Transact Menu
    Click Send Money to Mobile money
    Send Money To Mobile Money Favourites      Airtel Money

#Send Money To Favourite MPESA Number
#	[Documentation]    Send Money To Favourite MPESA Number
#	[Tags]    KE   RW   UG   TZ  SS
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To Mobile Money Favourites       M-PESA
#
#Send Money To Favourite T Kash Number
#	[Documentation]    Send Money To Favourite T Kash Number
#	[Tags]    KE   RW   UG   TZ  SS
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To Mobile Money Favourites      T Kash