<?php $uriFile = basename($_SERVER["REQUEST_URI"]); ?>

<nav class="navbar">    
    <a class="navbar__button <?= $uriFile == "me.php" ? "selected" : null ?>" href="me.php">Hem</a>
    <a class="navbar__button <?= $uriFile == "report.php" ? "selected" : ""; ?>" href="report.php">Rapport</a>
    <a class="navbar__button <?= $uriFile == "about.php" ? "selected" : ""; ?>" href="about.php">Om</a>
</nav>
