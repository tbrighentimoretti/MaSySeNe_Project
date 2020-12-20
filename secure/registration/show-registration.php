<?php 

    if ( !empty($_POST['do-registration']) && !empty($_POST['username']) && !empty($_POST['password']) ) {

        require 'do-registration.php';

    }

    // get header component
    require './components/header.php';

?>

<div id="registration-page-main">

    <h1>Registration</h1>

    <?php if ( !empty($_COOKIE['user']) && !empty($_COOKIE['token']) ) : ?>

        <div id="already-logged-in">

            <h3>You are logged in!</h3>

        </div>

    <?php else: ?>

        <?php if ( isset($userCreationBoolean) && $userCreationBoolean === true) : ?>

            <div id="registration-success">

                <h2>Registration done with success</h2>

                <a href="/?page=dashboard">Create your first post!</a>

            </div>

        <?php else : ?>

        <div id="registration-page-inner">

            <?php if ( isset($userCreationBoolean) && $userCreationBoolean === false) : ?>

                <div id="registration-page-error">

                    <p>Username already exists</p>

                </div>

            <?php elseif ( isset($incorrectInputs) && $incorrectInputs == true ) : ?>

                <div id="registration-page-error">

                    <p>Attention the password should have a minimum length of 5 and username a maximum length of 100</p>

                </div>


            <?php endif; ?>

            <form method="POST">

                <input type="text" name="username" maxlength="100" placeholder="username" required/>

                <input type="password" name="password" minlength="5" placeholder="password" required/>

                <input type="submit" name="do-registration" value="submit" required/>

            </form>

        </div>

        <?php endif; ?>

    <?php endif; ?>

</div>

</body>