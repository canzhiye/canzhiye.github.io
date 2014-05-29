<?php
 
require "/path/to/twilio-php/Services/Twilio.php";
 
// set your AccountSid and AuthToken from www.twilio.com/user/account
$AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$AuthToken = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY";
 
$client = new Services_Twilio($AccountSid, $AuthToken);
 
$message = $client->account->messages->create(
    "734-259-2717", // From this number
    "210-452-6889", // To this number
    "Test message!"
);
 
// Display a confirmation message on the screen
echo "Sent message {$message->sid}";