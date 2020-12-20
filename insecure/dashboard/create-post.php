<?php 

$title = $_POST['title'];

$content = $_POST['content'];

$username = $_COOKIE['user'];

$createPostBoolean = createPost($title, $content, $username);

if ($createPostBoolean !== false) {

    $createPostBoolean = true;

}