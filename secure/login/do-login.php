<?php 

sleep(5);

$username = cleanString($_POST['username']);

$password = cleanString($_POST['password']);

$userVerificationBoolean = verifyUser($username, $password);

if ($userVerificationBoolean === true) {

    createUserCookieSession($username);

}

// remove cookie sessions older than 10 days
$sql = 'DELETE FROM user_cookie_session WHERE created_at < NOW() - INTERVAL 10 DAY';
$stmt = $PDO->prepare($sql);
$stmt->execute();

