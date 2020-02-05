<?php $uriFile = basename($_SERVER["REQUEST_URI"]); ?>

<nav class="navbar">    
    <a class="navbar__button--NB <?= $uriFile == "me.php" ? "navbar__button--selected" : null ?>" href="me.php">Hem</a>
    <a class="navbar__button--NB <?= $uriFile == "report.php" ? "navbar__button--selected" : ""; ?>" href="report.php">Rapport</a>
    <a class="navbar__button--NB <?= $uriFile == "about.php" ? "navbar__button--selected" : ""; ?>" href="about.php">Om</a>
</nav>
