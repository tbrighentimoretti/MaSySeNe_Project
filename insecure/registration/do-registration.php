<?php 

$username = $_POST['username'];

$password = $_POST['password'];

if ( strlen($username) > 100 || strlen($password) < 5 ) {

    $incorrectInputs = true;

} else {

    $userCreationBoolean = createUser($username, $password);
    
    if ($userCreationBoolean !== false) {
    
        createUserCookieSession($username, $password); 

        $userCreationBoolean = true;
    
    }

    $incorrectInputs = false;

}




