*** Settings ***
Documentation  Verify That User can successfully Purchase Airtime
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/BuyAirtimePage.robot

*** Test Cases ***
Buy Airtime for Safaricom Customer
	[Documentation]    Safaricom Airtime Purchase
	[Tags]    KE
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Safaricom"]}     ${user_subsidiary["PHONE_NUMBER"]["Safaricom"]}
    Return Back to Transact Screen

Buy Airtime for Airtel Customer
	[Documentation]    Airtel Airtime Purchase
	[Tags]    KE   RW   TZ   UG
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Airtel"]}       ${user_subsidiary["PHONE_NUMBER"]["AirtelMoney"]}
    Return Back to Transact Screen

Buy Airtime for Equitel Customer
	[Documentation]    Equitel Airtime Purchase
	[Tags]    KE
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For    ${user_subsidiary["TELCO"]["Equitel"]}       ${user_subsidiary["PHONE_NUMBER"]["Equitel"]}
    Return Back to Transact Screen

Buy Airtime for Telkom Customer
	[Documentation]    Telkom Airtime Purchase
	[Tags]    KE
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Telkom"]}       ${user_subsidiary["PHONE_NUMBER"]["Telkom"]}
    Return Back to Transact Screen

Buy Airtime for MTN Customer
	[Documentation]    MTN Airtime Purchase
	[Tags]    RW   UG   SS
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["MTN"]}       ${user_subsidiary["PHONE_NUMBER"]["MTN"]}
    Return Back to Transact Screen

Buy Airtime for Vodacom Customer
	[Documentation]    Vodacom Airtime Purchase
	[Tags]    TZ
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Vodacom"]}       ${user_subsidiary["PHONE_NUMBER"]["Vodacom"]}
    Return Back to Transact Screen

Buy Airtime for Tigo Customer
	[Documentation]   Tigo Airtime Purchase
	[Tags]    TZ
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Tigo"]}       ${user_subsidiary["PHONE_NUMBER"]["Tigo"]}
    Return Back to Transact Screen

Buy Airtime for Zantel Customer
	[Documentation]    Zantel Airtime Purchase
	[Tags]    TZ
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Zantel"]}       ${user_subsidiary["PHONE_NUMBER"]["Zantel"]}
    Return Back to Transact Screen

Buy Airtime for Africell Customer
	[Documentation]    Africell Airtime Purchase
	[Tags]    UG
	Click on Transact Menu
    Click on Buy Airtime
    Buy Airtime For     ${user_subsidiary["TELCO"]["Africell"]}       ${user_subsidiary["PHONE_NUMBER"]["Africell"]}
    Return Back to Transact Screen
#
#Buy Airtime from Kenya to a Customer in Rwanda
#	[Documentation]   Airtime Purchase for Rwanda Customer
#	[Tags]    KE
#	Click on Transact Menu
#    Click on Buy Airtime
#    Buy Airtime For InterCountry      ${user_subsidiary["DESTINATION_COUNTRY"]["RW"]}      ${user_subsidiary["TELCO"]["RwandaAirtel"]}      ${user_subsidiary["PHONE_NUMBER"]["RwandaAirtel"]}
#    Return Back to Transact Screen