<?php 

if ( !empty($_POST['create_post']) && !empty($_POST['csrf_token']) && !empty($_POST['content']) && $_COOKIE['csrf_token'] == $_POST['csrf_token'] && verifyUserCookieSession() === true ) {

    require './comment/create-comment.php';
}

require './components/header.php';

if ( !empty($_GET['id']) && getSinglePost($_GET['id']) !== false ) : 

    $postQueryInformation = getSinglePost($_GET['id'])[0];

    $postCommentQuery = getComments($_GET['id']);
?>

<div id="post-page-title-container">

    <h1><?php echo $postQueryInformation['title']; ?></h1>

</div>

<div id="post-page-content-container">

    <p><?php echo $postQueryInformation['content']; ?></p>

</div>

<div id="post-page-comment-container">

    <?php if ( isset($_COOKIE['user']) ) : ?>

    <form method="POST">

        <h3>Write your comment</h3>

        <input type="hidden" name="csrf_token" value="<?php echo $_COOKIE['csrf_token']; ?>" />

        <textarea name="content">write here your comment</textarea>

        <input type="submit" name="create_post" value="submit" required/>

    </form>

    <?php else : ?>

        <a href="/?page=login" id="login-to-write-content">Login to write comments</a>

    <?php endif; ?> 

    <?php if ( !empty($postCommentQuery) ) : ?>

    <div id="post-page-comment-list">

        <h2>Commments</h2>

        <?php foreach($postCommentQuery as $singleRow) : ?>

            <div class="single-post-comment">

                <div class="single-post-comment-content">

                    <p><?php echo $singleRow['content']; ?></p>

                    <p class="comment-author">Author - <?php echo $singleRow['username']; ?></p>

                </div>

            </div>

        <?php endforeach; ?>

    </div>

    <?php endif; ?>

</div>

<?php else : ?>
    
<div id="problem-container">

    <h1>404</h1>

</div>

<?php endif; ?>