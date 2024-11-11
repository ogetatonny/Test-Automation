*** Settings ***
Documentation       Transactions Tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/SendMoney.robot

*** Test Cases ***
Send Money to Own Equity Account
	[Tags]    KE   UG   RW   TZ    SS
	Click on Transact Menu
	Click Send Money to Own Equity Account Menu
	Send Money To Own Equity Account

#Send Money to Another Equity Account
#	[Tags]    KE   UG   RW    TZ    SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money To Another Equity Account
#
#Send Money to Another Bank Account RTGS
#	[Tags]    KE   UG   RW    TZ    SS
#	Click on Transact Menu
#	Click Send Money to Another Bank Menu
#	Send Money To Another Bank
#
#Send Money to Another Bank Account EFT
#	[Tags]    KE   UG   RW    TZ    SS
#	Click on Transact Menu
#	Click Send Money to Another Bank Menu
#	Send Money To Another Bank EFT
##
#Send Money To Pesalink Mobile
#	[Documentation]    Send Money To Pesalink Mobile
#	[Tags]    KE
#	Click on Transact Menu
#    Click Send Money to Another Bank Menu
#    Send Money To Pesalink Mobile
#
#Send Money To other bank account (Pesalink - phone linked)
#	[Tags]    KE
#	Click on Transact Menu
#    Click Send Money to Another Bank Menu
#    Send Money To other bank account Pesalink phone linked
#
#Send Money to Another Bank Account SWIFT-Full Charges
#	[Tags]    KE   UG   RW    TZ    SS
#	Click on Transact Menu
#	Click Send Money to Another Bank Menu
#	Send Money To Another Bank SWIFT
#
#Send Money to Another Bank Account SWIFT-Share Charges
#	[Tags]    KE   UG   RW    TZ    SS
#	Click on Transact Menu
#	Click Send Money to Another Bank Menu
#	Send Money To Another Bank SWIFT-Share Charges
#
#Send Money To Airtel Money
#	[Tags]   KE   UG   RW   TZ   SS
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To Airtel Mobile Money
#
#Send Money To Vodacom Money
#	[Tags]   TZ
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To Vodacom Mobile Money
#
#Send Money To MPESA
#	[Tags]    KE
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To MPESA Mobile Money
#
#Send Money To T-Kash
#	[Tags]    KE
#    Click on Transact Menu
#    Click Send Money to Mobile money
#    Send Money To T-Kash Mobile Money
#
#Send Money - Pay to Card
#	[Tags]    KE
#	Click on Transact Menu
#	Click Pay To Card Menu
#	Send Money-Pay To Card