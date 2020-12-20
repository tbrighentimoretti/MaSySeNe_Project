<?php 

$dsn = 'mysql:host=localhost;dbname=blog';
$user = 'root';
$pwd = 'root';
$PDO = new PDO ($dsn, $user, $pwd);


// VULNERABILE
function createUser($username, $password) {

    global $PDO;
    $sql = "INSERT INTO user (username, password) VALUES ('$username','$password')";
    return $PDO->query($sql);

}

// VULNERABILE
function createPost($title, $content, $username) {

    global $PDO;
    $sql = "INSERT INTO post (title, content, username) VALUES ('$title','$content','$username')";
    return $PDO->query($sql);

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

    if ( !empty($selectQuery) && $password == $selectQuery[0]['password'] ) {

        return true;

    }else {

        return false;

    }

}

// VULNERABILE
function createComment($username, $content, $post) {

    global $PDO;
    $sql = "INSERT INTO comment (username, content, post) VALUES ('$username','$content','$post')";
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

// VULNERABILE
function createUserCookieSession($username, $password) {

    global $PDO;
    $sql = "INSERT INTO user_cookie_session (username, cookie_token) VALUES ('$username','$password')";
    $stmt = $PDO->query($sql);

    setcookie('user', $username, time() + (60*60*24*10), "/");
    setcookie('token', $password, time() + (60*60*24*10), "/"); 

}

function verifyUserCookieSession() {

    if ( isset($_COOKIE['user']) && isset($_COOKIE['token']) ) {

        $username = $_COOKIE['user'];
        $cookieToken = $_COOKIE['token'];

        global $PDO;
        $sql = 'SELECT * FROM user_cookie_session WHERE username = ? AND cookie_token = ?';
        $stmt = $PDO->prepare($sql);
        $stmt->execute( [$username, $cookieToken] );
        $selectQuery = $stmt->fetchAll();

        if ( !empty($selectQuery) ) {

            return true;
    
        } else {

            setcookie('user', NULL, time() - 3600);
            setcookie('token', NULL, time() - 3600);
    
            return false;
        }

    } else {

        return false;
    }

}