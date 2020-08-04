<!DOCTYPE html>
<html lang="sv">
<head>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=2,0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Cascading Stylesheet -->
    <link rel="stylesheet" href="css/lib/css/style.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:100,200,300,400,500,600,700&display=swap" rel="stylesheet">
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

<?php include __DIR__ . "/navbar.php" ?>
