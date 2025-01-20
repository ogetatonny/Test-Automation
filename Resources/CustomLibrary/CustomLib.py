# import random
# import string
# from robot.libraries.BuiltIn import BuiltIn
#
# __version__ = '1.0.0'
#
# class CustomLib(object):
#     ROBOT_LIBRARY_VERSION = __version__
#     ROBOT_LIBRARY_SCOPE = 'GLOBAL'
#
#     def get_random_name(self, email_length):
#         letters = string.ascii_lowercase[:12]
#         return ''.join(random.choice(letters) for i in range(email_length))
#
#     def generate_random_emails(self, length):
#
#         domains = ["hotmail.com", "gmail.com", "aol.com",
#                    "mail.com", "mail.kz", "yahoo.com"]
#
#         return [self.get_random_name(length)
#                 + '@'
#                 + random.choice(domains)]
#
# def is_tag_present(tag_name):
#     """
#     Checks if the given tag is present in the current test case.
#     """
#     tags = BuiltIn().get_variable_value("${TEST_TAGS}", [])
#     return tag_name in tags


import random
import string
from robot.libraries.BuiltIn import BuiltIn

__version__ = '1.0.0'

class CustomLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def get_random_name(self, email_length):
        """
        Generates a random string of lowercase letters with the given length.
        """
        letters = string.ascii_lowercase[:12]
        return ''.join(random.choice(letters) for _ in range(email_length))

    def generate_random_emails(self, length, count=1):
        """
        Generates a list of random email addresses.
        :param length: Length of the email username.
        :param count: Number of email addresses to generate.
        :return: List of random email addresses.
        """
        domains = ["hotmail.com", "gmail.com", "aol.com",
                   "mail.com", "mail.kz", "yahoo.com"]
        return [
            self.get_random_name(length) + '@' + random.choice(domains)
            for _ in range(count)
        ]

    def is_tag_present(self, tag_name):
        """
        Checks if the given tag is present in the current test case.
        """
        tags = BuiltIn().get_tags()
        return tag_name in tags
