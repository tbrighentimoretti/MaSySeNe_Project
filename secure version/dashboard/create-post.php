<?php 

$title = cleanString($_POST['title']);

$content = cleanString($_POST['content']);

$username = cleanString($_COOKIE['user']);

$createPostBoolean = createPost($title, $content, $username);