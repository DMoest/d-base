<!DOCTYPE html>
<html lang="sv">
<head>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=2,0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Cascading Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500&display=swap" rel="stylesheet">
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.png"/>
    <!-- Title -->
    <title><?= $title ?></title>
</head>
<body>
    <header class="site__header--outer">
        <div class="site__header--inner">
            <img src="img/CoconutPalmTree.png" alt="logo" class="site__logo">
            <span class="site__title">Daniel Andersson</span>
            <span class="site__slogan">Här ska jag ha en slogan om jag så bryr mig att lägga in en...</span>
        </div>
    </header>

<?php include __DIR__ . "/navbar.php" ?>
