<?php 

$username = $_POST['username'];

$password = $_POST['password'];

$userVerificationBoolean = verifyUser($username, $password);

if ($userVerificationBoolean === true) {

    createUserCookieSession($username, $password);

}

// remove cookie sessions older than 10 days
$sql = 'DELETE FROM user_cookie_session WHERE created_at < NOW() - INTERVAL 10 DAY';
$stmt = $PDO->prepare($sql);
$stmt->execute();

