import TestProfiles
import SubsidiaryParameters
from robot.libraries.BuiltIn import BuiltIn
# HomePage Data
# releaseUrl = "https://oneequity-release.azurewebsites.net/"
# home_page = "https://oneequity-release.azurewebsites.net/en/home"
test_user = BuiltIn().get_variable_value("${user}")
print(test_user)
# current_user = test_user.replace('"', '')
current_user = eval(test_user)
sub = current_user["subsidiary"]
sub1 = "SubsidiaryParameters." + sub
user_subsidiary = eval(sub1)
default_password = "Test@12345"
arg1 = "user2"
# arg2
#  robot --variable country:Mexico your_file.robot