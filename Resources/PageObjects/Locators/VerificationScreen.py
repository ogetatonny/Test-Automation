# Receive OTP options
verify_title = "class:page-title"
receive_otp_option1 = "xpath:(//mat-icon[contains(@class, 'mat-icon')])[2]"    # selects first verification option
receive_opt_option_next_button = "xpath://button[contains(@data-testid, 'choose-otp-method-btn-next')]"

# OTP Validation Page
login_otp_parent_form = "xpath://div[contains(@formarrayname, 'digits')]"
verify_otp_button = "xpath://button[contains(@data-testid, 'verify-otp-btn-verify')]"
resend_code_button = "xpath://button[contains(@data-testid, 'verify-otp-btn-resend')]"
try_another_otp_method_button = "xpath://button[contains(@data-testid, 'verify-otp-btn-another-method')]"


# Verification Menu - Security or card options
answer_security_questions_option = "xpath://mat-icon[contains(@data-mat-icon-type, 'font')]"
# "xpath:(//mat-icon[contains(@data-mat-icon-name, 'radio-button-off')])[1]" - Old locator by 12.02.2024
verify_with_card_details_option = "xpath:(//mat-icon[contains(@data-mat-icon-name, 'radio-button-off')])[2]"
confirm_verification_menu_button = "xpath://button[contains(@data-testid, 'verify-menu-btn-continue')]"


# Answer security questions page - Customer with same answer for all questions
close_security_text_button = "xpath:(//button[contains(@class, 'mdc-icon-button')])[6]"
answer_to_first_sec_question = "xpath:(//input[contains(@placeholder, 'Enter your answer')])[1]"
answer_to_second_sec_question = "xpath:(//input[contains(@placeholder, 'Enter your answer')])[2]"
confirm_sec_questions_button = "xpath://button[contains(@data-testid, 'verify-security-querstions-btn-confirm')]"

# SECURITY QUESTION
# Security questions
ANCHOR_SECURITY_QUESTION_SCREEN = "ke.co.equitygroup.equitymobile.debug:id/toolbarTitle"
# Answer your security question to continue
SECURITY_QUESTION_HEADER = "ke.co.equitygroup.equitymobile.debug:id/header"
VERIFICATION_BY_SECURITY_QUESTION = "ke.co.equitygroup.equitymobile.debug:id/itemText"


FIRST_SECURITY_QUESTION_TEXT = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/firstQuestion"]'
SECOND_SECURITY_QUESTION_TEXT = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/secondQuestion"]'
FIRST_SECURITY_QUESTION = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/firstQuestion"]'
SECOND_SECURITY_QUESTION = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/secondQuestion"]'
FIRST_SECURITY_QUESTION_FIELD = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/textinput_placeholder"][1]'
SECOND_SECURITY_QUESTION_FIELD = '//android.widget.LinearLayout[@resource-id="ke.co.equitygroup.equitymobile.debug:id/secondQuestionAnswer"]'


# FIRST_SECURITY_QUESTION_TEXT = '(//android.widget.RadioButton[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemRadioButton"])[1]'
# SECOND_SECURITY_QUESTION_TEXT = '(//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText"])[2]'
# FIRST_SECURITY_QUESTION = "ke.co.equitygroup.equitymobile.debug:id/firstQuestion"
# SECOND_SECURITY_QUESTION = "ke.co.equitygroup.equitymobile.debug:id/secondQuestion"
# FIRST_SECURITY_QUESTION_FIELD = '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/textinput_placeholder"][1]'
# SECOND_SECURITY_QUESTION_FIELD = "//android.widget.TextView[@text='Enter your answer']"

# FIRST_SECURITY_QUESTION = "ke.co.equitygroup.equitymobile.debug:id/firstQuestionText"
#SECOND_SECURITY_QUESTION = "ke.co.equitygroup.equitymobile.debug:id/secondQuestionText"
# FIRST_SECURITY_QUESTION_FIELD = "//android.widget.EditText[@resource-id='ke.co.equitygroup.equitymobile.debug:id/firstAnswerET']"
# SECOND_SECURITY_QUESTION_FIELD = "//android.widget.EditText[@resource-id='ke.co.equitygroup.equitymobile.debug:id/secondAnswerET']"
CONFIRM_SEC_QUESTIONS_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/confirm"
# Looks like that answer is incorrect, please try again
TRY_AGAIN_BUTTON = "android.widget.Button[@text='Try again']"

# New device sign-in

# SMS VERIFICATION
# Verify
ANCHOR_VERIFY_SCREEN = "ke.co.equitygroup.equitymobile.debug:id/toolbarTitle"
CHANGE_CONTACT_DETAILS_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/detailsChangedButton"
SMS_RADIO_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/itemRadioButton"
# SMS_VERIFICATION_FIELD = "//android.widget.TextView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/itemSubText' and @text='2*****']"
SMS_VERIFICATION_FIELD = "ke.co.equitygroup.equitymobile.debug:id/itemRadioButton"
EMAIL_VERIFICATION_FIELD = "//android.widget.TextView[@text= 'By Email']"
CONFIRM_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/confirmButton"
VERIFICATION_CODE_1 = "ke.co.equitygroup.equitymobile.debug:id/digit1"
VERIFICATION_CODE_2 = "ke.co.equitygroup.equitymobile.debug:id/digit2"
VERIFICATION_CODE_3 = "ke.co.equitygroup.equitymobile.debug:id/digit3"
VERIFICATION_CODE_4 = "ke.co.equitygroup.equitymobile.debug:id/digit4"
VERIFICATION_CODE_5 = "ke.co.equitygroup.equitymobile.debug:id/digit5"
VERIFICATION_CODE_6 = "ke.co.equitygroup.equitymobile.debug:id/digit6"
NEED_HELP_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/needHelpButton"


# SEES WHATS NEW MODAL
# Seen what’s new?
ANCHOR_SEEN_WHAT_NEW_MODAL = "ke.co.equitygroup.equitymobile.debug:id/titleText"
CLOSE_WHATS_NEW_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/crossForeground"
#SHOW_ME_LATER_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/secondaryButton"
SHOW_ME_LATER_BUTTON = '//android.widget.Button[@resource-id="ke.co.equitygroup.equitymobile.debug:id/secondaryButton"]'
LETS_GO_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/primaryButton"
WHAT_NEW_MODAL_DESCRIPTION="ke.co.equitygroup.equitymobile.debug:id/descriptionText"
# Take a quick tour to explore whats new. If you want to get explore later, you can find this under Support, in Settings


