<?php 

    if ( !empty($_POST['do-login']) && !empty($_POST['username']) && !empty($_POST['password']) ) {

        require 'do-login.php';

    }

    // get header component
    require './components/header.php';


?>

<div id="loading-page-main">
 
    <div id="loading-page-progress"></div>

</div>

<div id="login-page-main">

    <h1>Login</h1>

    <?php if ( $userVerificationBoolean === true || verifyUserCookieSession() === true ) : ?>

        <div id="already-logged-in">

            <h3>You are logged in!</h3>

        </div>

    <?php else: ?>

    <div id="login-page-inner">

        <?php if ( isset($userVerificationBoolean) && $userVerificationBoolean === false ) : ?>

            <div id="registration-page-error">

                <p>username or password is wrong</p>

            </div>

        <?php endif; ?>

            <form method="POST" onsubmit="showLoadingPage()">

                <input type="text" name="username" placeholder="username" required/>

                <input type="password" name="password" placeholder="password" required/>

                <input type="submit" name="do-login" value="submit" required/>

            </form>

        </div>

        <?php endif; ?>

    </div>

    <script>

        function showLoadingPage() {

            document.getElementById('loading-page-main').style.display = 'flex';

            var progessBar = document.getElementById("loading-page-progress");

            setTimeout(function() {

                document.getElementById('loading-page-main').style.opacity = '1';
                
            }, 1000);

            var timeleft = 5;

            var width = 0;

            var downloadTimer = setInterval(function(){

                if(timeleft <= 0){

                    clearInterval(downloadTimer);

                }

                if (timeleft == 3) {

                    document.getElementById('loading-page-main').style.backgroundColor = '#11998e';

                } else if(timeleft == 2) {

                    document.getElementById('loading-page-main').style.backgroundColor = '#38ef7d';

                }else if (timeleft == 1) {

                    document.getElementById('loading-page-main').style.opacity = '0';

                }

                progessBar.innerText = timeleft;
                progessBar.style.width = 150 + width * 80 + 'px';
                width += 1;
                timeleft -= 1;

            }, 1000);

        }

    </script>

</body>