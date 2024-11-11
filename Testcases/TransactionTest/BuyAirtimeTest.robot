*** Settings ***
Documentation  Verify That User can successfully Purchase Airtime
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/BuyAirtimePage.robot

*** Test Cases ***
#Buy Airtime for Safaricom Customer
#	[Documentation]    Safaricom Airtime Purchase
#	[Tags]    KE
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Safaricom Users
#    Return Back to Transact Screen
#
#Buy Airtime for Airtel Customer
#	[Documentation]    Airtel Airtime Purchase
#	[Tags]    KE   RW   TZ   UG
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Airtel Users
#    Return Back To Home Screen
#
#Buy Airtime for Equitel Customer
#	[Documentation]    Equitel Airtime Purchase
#	[Tags]    KE
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Equitel Users
#    Return Back to Transact Screen
#
#Buy Airtime for Telkom Customer
#	[Documentation]    Telkom Airtime Purchase
#	[Tags]    KE
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Telkom Users
#    Return Back to Transact Screen
#
#Buy Airtime for MTN Customer
#	[Documentation]    MTN Airtime Purchase
#	[Tags]    RW   UG   SS
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for MTN Users
#    Return Back to Home Screen
#
#Buy Airtime for Vodacom Customer
#	[Documentation]    Vodacom Airtime Purchase
#	[Tags]    TZ
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Vodacom Users
#    Return Back to Transact Screen
#
#Buy Airtime for Tigo Customer
#	[Documentation]   Tigo Airtime Purchase
#	[Tags]    TZ
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Tigo Users
#    Return Back to Transact Screen
#
#Buy Airtime for Zantel Customer
#	[Documentation]    Zantel Airtime Purchase
#	[Tags]
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Zantel Users
#    Return Back to Transact Screen
#
#Buy Airtime for Africell Customer
#	[Documentation]    Africell Airtime Purchase
#	[Tags]
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase for Africell Users
#    Return Back to Transact Screen
#
#Buy Airtime from Kenya to a Customer in Rwanda
#	[Documentation]   Airtime Purchase From Kenya for Rwanda Customer
#	[Tags]    KE
#	Click on Transact Menu
#    Click on Buy Airtime
#    Airtime Purchase From Kenya for Rwanda Customer
#    Return Back to Transact Screen