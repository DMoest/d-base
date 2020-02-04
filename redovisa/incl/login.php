<?php 
if (isset($_SESSION["user"])) {
    echo "Välkommen '{$_SESSION["user"]}'.";
    echo " <a href=\"session/login/logout.php\">logout</a>";
}
