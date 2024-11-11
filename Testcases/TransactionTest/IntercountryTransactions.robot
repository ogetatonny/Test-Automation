*** Settings ***
Documentation       Intercountry Transactions Tests
Library  AppiumLibrary
Library  Screenshot    default_directory=../Screenshots
Resource    ../../Resources/PageObjects/KeywordDefinitions/SendMoney.robot

*** Test Cases ***
#Send Money to Uganda Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']} to Uganda
#	[Tags]    KE   RW   TZ   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity account In Uganda
#
#Send Money to Tanzania Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']} to Tanzania
#	[Tags]    KE   RW   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity account In Tanzania
#
#Send Money to Rwanda Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']} to Rwanda
#	[Tags]    KE   TZ   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity account In Rwanda
#
#Send Money to Kenya Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']} to Kenya
#	[Tags]    SS   TZ   UG   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity account In Kenya
#
#Send Money to South Sudan Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']} to South Sudan
#	[Tags]    KE   TZ   UG   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity account In South Sudan
#
#
#Send Money to UG-USD Account Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-${user_subsidiary["LOCAL_CURRENCY"]} to USD-Uganda
#	[Tags]    SS   TZ   KE   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity USD account In Uganda
#
#Send Money to TZ-USD Account Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-${user_subsidiary["LOCAL_CURRENCY"]} to USD-Tanzania
#	[Tags]    SS   UG   KE   RW
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity USD account In Tanzania
#
#Send Money to RW-USD Account Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-${user_subsidiary["LOCAL_CURRENCY"]} to USD-Rwanda
#	[Tags]    SS   UG   KE   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity USD account In Rwanda
#
#Send Money to KE-USD Account Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-${user_subsidiary["LOCAL_CURRENCY"]} to USD-Kenya
#	[Tags]    RW   UG   SS   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity USD account In Kenya
#
#Send Money to SS-USD Account Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-${user_subsidiary["LOCAL_CURRENCY"]} to USD-South Sudan
#	[Tags]    RW   UG   KE   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money to Another Equity USD account In South Sudan
#
#
#Send Money from USD to KE Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD Account to Kenya KES
#	[Tags]    RW   UG   SS   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD Account to Local Equity account In Kenya
#
#Send Money from USD to TZ Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD Account to Tanzania TZS
#	[Tags]    RW   UG   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD Account to Local Equity account In Tanzania
#
#Send Money from USD to RW Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD Account to Rwanda RWF
#	[Tags]    TZ   UG   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD Account to Local Equity account In Rwanda
#
#Send Money from USD to UG Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD Account to Uganda UGX
#    [Tags]    TZ   RW   SS   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD Account to Local Equity account In Uganda
#
#Send Money from USD to SS Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD Account to South Sudan SSP
#    [Tags]    TZ   RW   UG   KE
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money from USD Account to Local Equity account In South Sudan
#
#
#Send Money from USD to KE-USD Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD to USD-Kenya
#	[Tags]    TZ   RW   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money From USD to Another Equity USD account In Kenya
#
#Send Money from USD to TZ-USD Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD to USD-Tanzania
#	[Tags]    KE   RW   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money From USD to Another Equity USD account In Tanzania
#
#Send Money from USD to RW-USD Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD to USD-Rwanda
#	[Tags]    KE   TZ   UG   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money From USD to Another Equity USD account In Rwanda
#
#Send Money from USD to UG-USD Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD to USD-Uganda
#	[Tags]    KE   RW   TZ   SS
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money From USD to Another Equity USD account In Uganda
#
#Send Money from USD to SS-USD Successfully
#	[Documentation]    Send Money From ${current_user['subsidiary']}-USD to USD-South Sudan
#	[Tags]    KE   RW   UG   TZ
#	Click on Transact Menu
#	Click Send Money to Another Equity account Menu
#	Send Money From USD to Another Equity USD account In South Sudan