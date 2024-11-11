*** Settings ***
Documentation  Verify That User can successfully Pay Bills
Library   AppiumLibrary
Library   Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/PayBillsPage.robot

#*** Test Cases ***
#Bill Payment for KPLC Customer
#	[Tags]    KE
#	[Documentation]    Bill Payment for KPLC
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For KPLC Customer
#
#Bill Payment for ZUKU Customer
#	[Documentation]    Bill Payment for ZUKU
#	[Tags]    KE
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For ZUKU Customer
#
#Bill Payment for WASAC Customer
#	[Tags]    RW
#	[Documentation]    Bill Payment for WASAC
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For WASAC Customer
#
#Bill Payment for MTN Customer
#	[Tags]    UG
#	[Documentation]    Bill Payment for MTN
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For MTN Customer
#
#Bill Payment for UMENE Customer
#	[Tags]    UG
#	[Documentation]    Bill Payment for UMENE
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For UMENE Customer
#
#Bill Payment for LUKU Customer
#	[Tags]      TZ
#	[Documentation]    Bill Payment for LUKU
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For LUKU Customer
#
#Bill Payment for TrinityTech Customer
#	[Tags]    SS
#	[Documentation]    Bill Payment for
#	Click on Transact Menu
#	Click on Pay Bill Menu
#	Pay Bill For TrinityTech Customer
