
# fixed deposit
def get_period_element(period):
    return f'//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/itemText" and @text="{period}"]'


# goal account
def get_goal_card(goal_text):
    return f'//android.widget.TextView[@resource-id="ke.co.equitygroup.equitymobile.debug:id/accountName" and @text="{goal_text}"]'