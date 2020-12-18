<?php

require 'auth.php';

if ( isset($_GET['page']) ) {

    $page = $_GET['page'];

    switch ($page) {

        case 'login':
        
            require 'login/show-login.php';

            break;

        case 'registration':

            require 'registration/show-registration.php';

            break;
        
        case 'post':

            require 'post/show-post.php';

            break;

        case 'dashboard':

            require 'dashboard/show-dashboard.php';
    
            break;

    }

} else {

    require 'home/show-home.php';

}

?>