<?php 

$username = $_COOKIE['user'];

$content = cleanString($_POST['content']);

$post = cleanString($_GET['id']);

createComment($username, $content, $post);