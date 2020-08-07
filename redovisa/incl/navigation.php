<?php $uriFile = basename($_SERVER["REQUEST_URI"]); ?>

<div class="navigation--outer">
    <nav class="navigation--inner"> 
        <a class="navigation__button--NB <?= $uriFile == "me.php" ? "navigation__button--selected" : null ?>" href="me.php">Hem</a>
        <a class="navigation__button--NB <?= $uriFile == "report.php" ? "navigation__button--selected" : ""; ?>" href="report.php">Rapport</a>
        <a class="navigation__button--NB <?= $uriFile == "about.php" ? "navigation__button--selected" : ""; ?>" href="about.php">Om</a>
    </nav>
</div>
