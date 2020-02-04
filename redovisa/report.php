<?php
require __DIR__ . "/config.php";
require __DIR__ . "/src/functions.php";

$pageReference = $_GET["page"] ?? "kmom01";
$base = basename(__FILE__, ".php");

$pages = [
    "kmom01" => [
        "title" => "kmom01",
        "file" => __DIR__ . "/$base/kmom01.php"
    ],
    "kmom02" => [
        "title" => "kmom02",
        "file" => __DIR__ . "/$base/kmom02.php",
    ],
    "kmom03" => [
        "title" => "kmom03",
        "file" => __DIR__ . "/$base/kmom03.php",
    ],
    "kmom04" => [
        "title" => "kmom04",
        "file" => __DIR__ . "/$base/kmom04.php",
    ],
    "kmom05" => [
        "title" => "kmom05",
        "file" => __DIR__ . "/$base/kmom05.php",
    ],
    "kmom06" => [
        "title" => "kmom06",
        "file" => __DIR__ . "/$base/kmom06.php",
    ],
    "kmom07" => [
        "title" => "kmom07",
        "file" => __DIR__ . "/$base/kmom07.php",
    ]
];

$page = $pages[$pageReference] ?? null;

$title = $page["title"] . " - HTMLPHP" ?? "404";
$title .= " | DAAP19";

include __DIR__ . "/incl/header.php";
include __DIR__ . "/$base/report_multi.php";
include __DIR__ . "/incl/byline.php";
include __DIR__ . "/incl/footer.php";
