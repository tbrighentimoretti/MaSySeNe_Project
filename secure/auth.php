<?php 

$dsn = 'mysql:host=localhost; dbname=blog';
$user = 'root';
$pwd = 'root';
$PDO = new PDO ($dsn, $user, $pwd);

function createUser($username, $password) {

    global $PDO;
    $sql = 'INSERT INTO user (username, password) VALUES (?,?)';
    $stmt = $PDO->prepare($sql);
    return $stmt->execute( [$username, $password] );

}

function createPost($title, $content, $username) {

    global $PDO;
    $sql = 'INSERT INTO post (title, content, username) VALUES (?,?,?)';
    $stmt = $PDO->prepare($sql);
    return $stmt->execute( [$title, $content, $username] );

}

function getUserPosts($username) {

    global $PDO;
    $sql = 'SELECT * FROM post WHERE username = ? ORDER BY id DESC';
    $stmt = $PDO->prepare($sql);
    $stmt->execute( [$username] );
    return $stmt->fetchAll();

}

function getPosts() {

    global $PDO;
    $sql = 'SELECT * FROM post ORDER BY id DESC';
    $stmt = $PDO->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();

}

function getSinglePost($id) {

    global $PDO;
    $sql = 'SELECT * FROM post WHERE id = ?';
    $stmt = $PDO->prepare($sql);
    $stmt->execute( [$id] );
    $postQuery = $stmt->fetchAll();

    if ( !empty($postQuery) ) {

        return $postQuery;

    }else {

        return false;
    }

} 
 
function verifyUser($username, $password) {

    global $PDO;
    $sql = 'SELECT * FROM user WHERE username = ?';
    $stmt = $PDO->prepare($sql);
    $stmt->execute( [$username] );
    $selectQuery = $stmt->fetchAll();

    if ( !empty($selectQuery) && password_verify($password, $selectQuery[0]['password']) ) {

        return true;

    }else {

        return false;

    }

}

function createComment($username, $content, $post) {

    global $PDO;
    $sql = 'INSERT INTO comment (username, content, post) VALUES (?,?,?)';
    $stmt = $PDO->prepare($sql);
    return $stmt->execute( [$username, $content, $post] );

}

function getComments($post) {

    global $PDO;
    $sql = 'SELECT * FROM comment WHERE post = ? ORDER BY id DESC';
    $stmt = $PDO->prepare($sql);
    $stmt->execute( [$post] );
    return $stmt->fetchAll();

}

function createUserCookieSession($username) {

    $cookieToken = substr( password_hash( rand() . randomPassword(), PASSWORD_DEFAULT ), 0 , 50);
    $csrfToken = md5( rand() . randomPassword() );
    $ipAddress = getClientIP();

    global $PDO;
    $sql = 'INSERT INTO user_cookie_session (username, cookie_token, ip) VALUES (?,?,?)';
    $stmt = $PDO->prepare($sql);
    $stmt->execute( [$username, $cookieToken, $ipAddress] );

    setcookie('user', $username, time() + (60*60*24*10), "/");
    setcookie('csrf_token', $csrfToken, time() + (60*60*24*10), "/");
    setcookie('token', $cookieToken, time() + (60*60*24*10), "/");

}

function verifyUserCookieSession() {

    if ( isset($_COOKIE['user']) && isset($_COOKIE['csrf_token']) && isset($_COOKIE['token']) ) {

        $username = $_COOKIE['user'];
        $cookieToken = $_COOKIE['token'];
        $ipAddress = getClientIP();

        global $PDO;
        $sql = 'SELECT * FROM user_cookie_session WHERE username = ? AND cookie_token = ? AND ip = ?';
        $stmt = $PDO->prepare($sql);
        $stmt->execute( [$username, $cookieToken, $ipAddress] );
        $selectQuery = $stmt->fetchAll();

        if ( !empty($selectQuery) ) {

            return true;
    
        } else {

            setcookie('user', NULL, time() - 3600);
            setcookie('csrf_token', NULL, time() - 3600);
            setcookie('token', NULL, time() - 3600);
    
            return false;
        }

    } else {

        return false;
    }

}

function randomPassword() {

    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";

    $pass = array();
    $alphaLength = strlen($alphabet) - 1;

    for ($i = 0; $i < 9; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }

    return implode($pass);
}

function getClientIP() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function cleanString($notCleanedString) {

    return filter_var($notCleanedString, FILTER_SANITIZE_STRING);

}
