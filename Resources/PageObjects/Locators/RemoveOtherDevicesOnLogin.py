# New device sign-in after login
old_devices = "xpath://div[contains(@class, 'selection-item')]"    # xpath for all signed-in devices

remove_devices_button = "xpath://button"



# New device sign-in
NEW_DEVICE_REMOVE_POPUP = "ke.co.equitygroup.equitymobile.debug:id/newDeviceLabel"
DEVICE_LIST = "ke.co.equitygroup.equitymobile.debug:id/recycler"
# androidx.recyclerview.widget.RecyclerView
OLD_EXISTING_DEVICES = "//androidx.cardview.widget.CardView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/itemCard']"
#OLD_EXISTING_DEVICES= '//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemSubText" and @text="Last active session"]'
REMOVE_DEVICE_BUTTON = "ke.co.equitygroup.equitymobile.debug:id/removeDeviceButton"
SIGNED_IN_DEVICES = "ke.co.equitygroup.equitymobile.debug:id/newDeviceDescription"
DEVICE_RADIO_BUTTONS = "ke.co.equitygroup.equitymobile.debug:id/itemRadioButton"
DEVICE_CHECKED = "//android.widget.CheckBox[@checked='true']"
EACH_DEVICE = "ke.co.equitygroup.equitymobile.debug:id/itemParent"
LAST_ACTIVE_DEVICES = "//android.widget.CheckBox[@resource-id='ke.co.equitygroup.equitymobile.debug:id/itemRadioButton']"
DEVICE_LIsST = "//android.widget.ScrollView//android.view.ViewGroup//androidx.recyclerview.widget.RecyclerView//androidx.cardview.widget.CardView[@resource-id='ke.co.equitygroup.equitymobile.debug:id/itemCard']"

# //android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemSubText"]