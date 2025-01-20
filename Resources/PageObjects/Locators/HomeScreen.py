

SCREEN_TITLE_FIELD = "ke.co.equitygroup.equitymobile.debug:id/toolbar_title"
SCREEN_TITLE_TEXT = "ke.co.equitygroup.equitymobile.debug:id/toolbarTitle"
MAIN_TITLE = "ke.co.equitygroup.equitymobile.debug:id/tvTitle"

# SHORTCUT FEATURES
SEND_MONEY_TO_EQUITY_ACCOUNT_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Send to' and @text='Equity account']"
SEND_MONEY_TO_MOBILE_MONEY_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Send to' and @text='Mobile money']"
SEND_MONEY_TO_ANOTHER_BANK_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Send to' and @text='Another bank']"
PAY_BILLS_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Pay' and @text='Bills']"
BUY_GOODS_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Buy' and @text='Goods']"
BUY_AIRTIME_FEATURE_SHORTCUT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Buy' and @text='Airtime']"
FEATURE_SHORTCUT_LIST_INDICATOR = "ke.co.equitygroup.equitymobile.debug:id/shortCutListIndicator"

VIEW_ALL_ACCOUNTS_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/accountsViewAll"
SHOW_MY_BALANCE_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/showBalanceText"
HIDE_MY_BALANCE_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/hideBalanceText"
YOU_HAVE_LABEL = "ke.co.equitygroup.equitymobile.debug:id/youHaveLabel"
YOU_OWE_LABEL = "ke.co.equitygroup.equitymobile.debug:id/youOweLabel"
TOTAL_BALANCE_AMOUNT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/totalBalance"
TOTAL_LIABILITY_AMOUNT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/totalLiability"
BALANCE_INFORMATION_LABEL = "//android.widget.TextView[@text='Balance information']"


FIRST_ACCOUNT_INDICATOR = "//android.widget.ImageView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/backgroundTypeIndicator'][1]"
BALANCE_INFORMATION_BUTTON = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/accountInformationMenuItemTitle' and @text='Balance information']"
CURRENT_ACCOUNT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/backgroundTypeIndicator"
AVAILABLE_ACCOUNT_BALANCE_FIELD = "//androidx.recyclerview.widget.RecyclerView[@index='1']/android.view.ViewGroup[1]//android.widget.TextView[2]"
TOTAL_BALANCE_FIELD="//androidx.recyclerview.widget.RecyclerView[@index='1']/android.view.ViewGroup[2]//android.widget.TextView[2]"
LIEN_AMOUNT_FIELD="//androidx.recyclerview.widget.RecyclerView[@index='1']/android.view.ViewGroup[3]//android.widget.TextView[2]"
UNCLEARED_AMOUNT_FIELD="//androidx.recyclerview.widget.RecyclerView[@index='1']/android.view.ViewGroup[4]//android.widget.TextView[2]"

# MENU
TRANSACT_MENU = "//android.widget.TextView[contains(@text='Transact')]"
BORROW_MENU = "//android.widget.TextView[contains(@text='Borrow')]"
SAVE_MENU = "//android.widget.TextView[contains(@text='Save')]"

ACCOUNT_ACTION_LINK = "ke.co.equitygroup.equitymobile.debug:id/accountActions"
ACCOUNT_NUMBER_TEXT = "ke.co.equitygroup.equitymobile.debug:id/accountNumber"
VERIFY_ACCOUNT = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/accountNumber' and contains(@text,'CAA')]"
ACCOUNT_LIST_INDICATOR = "//android.view.View[@resource-id='ke.co.equitygroup.equitymobile.debug:id/accountListIndicator']"




SETTINGS_TAB = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/iconSubText' and @text='Settings']"
ACCOUNTS_MENU_TAB = "ke.co.equitygroup.equitymobile.debug:id/accountsItemContainer"
EQUITY_HOME_TAB = "ke.co.equitygroup.equitymobile.debug:id/equityHomeFab"

NOTIFICATIONS_ICON = "ke.co.equitygroup.equitymobile.debug:id/imgNotifications"
NOTIFICATIONS_PREFERENCES = "ke.co.equitygroup.equitymobile.debug:id/preferenceCardHolder"


SIGN_OUT_CONFIRMATION = "//android.widget.TextView[@text = 'Are you sure you want to sign out?']"
KEEP_ME_IN = "//android.widget.Button[@text ='Keep me in']"
TRY_ANOTHER_METHOD = "//android.widget.TextView[@text= 'Try another method']"

LOG_OUT_START_ICON = "ke.co.equitygroup.equitymobile.debug:id/startIconCard"
SIGN_OUT_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/contentSignOut"
CONFIRM_SIGN_OUT_BUTTON = "//android.widget.Button[@text='Sign me out']"
CONFIRM_KEEP_ME_IN_BUTTON = "//android.widget.Button[@text='Keep me in']"


LOAN_TEXT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/myBalance"
HIDE_BALANCE_TEXT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/showHideBalanceText"
LOAN_ACTION_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/loanAction"
LOAN_BALANCE_FIELD = "ke.co.equitygroup.equitymobile.debug:id/loanBalance"
#Loan balance: 80,000.00 KES
LOAN_INSTALLMENT_FIELD = "ke.co.equitygroup.equitymobile.debug:id/loanAmountInstallment"
#14,082.00 KES per month
NEXT_PAYMENT_LABEL_FIELD = "ke.co.equitygroup.equitymobile.debug:id/loanDaysTitle"
#Next Payment

# Newly added - Ogeta
# account linking and unlinking
DOTS_ON_ACCOUNT_CARD='ke.co.equitygroup.equitymobile.debug:id/accountActions'
UNLINK_LINK='//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text="Unlink account"]'
NO_KEEP_BUTTON='ke.co.equitygroup.equitymobile.debug:id/secondaryButton'
YES_UNLINK_BUTTON='ke.co.equitygroup.equitymobile.debug:id/primaryButton'
REMOVE_POPUP_BUTTON='ke.co.equitygroup.equitymobile.debug:id/crossForeground'
GREAT_DISMISS_BUTTON='//android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/primaryButton" and @text="Dismiss"]'