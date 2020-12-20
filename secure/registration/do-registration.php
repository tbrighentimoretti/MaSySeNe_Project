<?php 

$username = cleanString($_POST['username']);

$password = cleanString($_POST['password']);

if ( strlen($username) > 100 || strlen($password) < 5 ) {

    $incorrectInputs = true;

} else {

    $hashPassword = password_hash($password, PASSWORD_DEFAULT);

    $userCreationBoolean = createUser($username, $hashPassword);
    
    if ($userCreationBoolean === true) {
    
        createUserCookieSession($username);
    
    }

    $incorrectInputs = false;

}




