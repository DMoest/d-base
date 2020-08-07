<!DOCTYPE html>
<html lang="sv">
<head>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=2,0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Web Font Loader -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
    <script type="text/javascript" src="js/fontLoader.js"></script>

    <!-- Cascading Stylesheet -->
    <link rel="stylesheet" href="css/lib/style.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,400;1,300&family=Pacifico&family=Roboto+Condensed&display=swap" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.png"/>

    <!-- Title -->
    <title><?= $title ?></title>
</head>
<body>
    <header class="site__header--outer">
        <div class="cover__image"></div>
        
        <div class="site__header--inner">
                <img src="img/CoconutPalmTree--light.svg" alt="logo" class="site__logo">
                <span class="site__title">Daniel Andersson</span>
                <span class="site__slogan">JaaaaAa, vad ska man ha för slogan egentligen...?</span>
        </div>
    </header>

<?php include __DIR__ . "/navigation.php" ?>
