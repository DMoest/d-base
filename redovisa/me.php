<?php 
// Standardinludering av Config & Functions
require __DIR__ . "/config.php";
require __DIR__ . "/src/functions.php";

$title = "Lite om mig";
$title .= " | DAAP19";

include __DIR__ . "/incl/header.php";
include __DIR__ . "/view/me.php";
include __DIR__ . "/incl/byline.php";
include __DIR__ . "/incl/footer.php";
