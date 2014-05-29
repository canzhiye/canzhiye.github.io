<?php
 
require "/twilio-php-master/Services/Twilio.php";
 
// set your AccountSid and AuthToken from www.twilio.com/user/account
$AccountSid = "AC67e8c7be7a1ada92885b86e4f505eef6";
$AuthToken = "3bca0413f1e68a8ca6897d9ff8dd3dee";
 
$client = new Services_Twilio($AccountSid, $AuthToken);
 
$message = $client->account->messages->create(
    "734-259-2717", // From this number
    "210-452-6889", // To this number
    "fuck you bitch!"
);

// Display a confirmation message on the screen
echo "Sent message {$message->sid}";
?>