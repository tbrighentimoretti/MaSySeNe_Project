<?php

// get header component
require 'components/header.php';

$postQuery = getPosts();

?>


<div id="home-page-banner-main">

    <h1>Blog Project</h1>

</div>

<div id="home-page-latest-posts">

    <h2>Latest Posts</h2>

    <?php if ( empty($postQuery) ) : ?>

        <h4>no posts found</h4>

    <?php else: ?>

    <div id="dahboard-list-of-posts">

    <?php foreach ($postQuery as $singleRow) : ?>

        <div class="single-post">

            <a href="/?page=post&id=<?php echo $singleRow['id']; ?>">

                <div class="single-post-title">

                    <?php echo $singleRow['title']; ?>

                </div>

                <div class="single-post-content">

                    <p><?php echo $singleRow['content']; ?></p>
                
                </div>

                <div class="single-post-author">

                    Author - <?php echo $singleRow['username']; ?>

                </div>

            </a>

        </div>

    <?php endforeach; ?>

    </div>

    <?php endif; ?>

</div>

</body>