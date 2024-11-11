*** Settings ***
Documentation  Verify That User can successfully Buy Goods
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/BuyGoodsPage.robot

*** Test Cases ***
#User Buy Goods Successfully from a Merchant
#	[Documentation]    User Buy Goods Successfully from a Merchant
#	[Tags]    KE   UG  RW  TZ
#	Click on Transact Menu
#	Click on Buy Goods
#    Buy Goods From A Merchant