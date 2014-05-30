# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient
 
# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "AC67e8c7be7a1ada92885b86e4f505eef6"
auth_token  = "3bca0413f1e68a8ca6897d9ff8dd3dee"
client = TwilioRestClient(account_sid, auth_token)
 
sms = client.sms.messages.create(body="fuck you bitch",
    to="+12104526889",
    from_="+17342592717")
print sms.sid