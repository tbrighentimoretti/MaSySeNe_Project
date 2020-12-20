<?php 

$username = $_COOKIE['user'];

$content = $_POST['content'];

$post = $_GET['id'];

createComment($username, $content, $post);