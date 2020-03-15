<?php
/* ANVÄNDBARA FUNKTIONER SOM KAN ANVÄNDAS OM OCH OM IGEN PÅ WEBBPLATSEN. */

// Funktion - Laddade filer:
function getLoadedFiles() 
{
    return "Du har inkluderat " . count(get_included_files()) . " filer.";
}

// Funktion - Tid att ladda sidan:
function getPageLoadTime() 
{
    $timestampFirst = $_SERVER["REQUEST_TIME_FLOAT"];
    $timestampLast = microtime(true);
    $diff = $timestampLast - $timestampFirst;
    return round($diff*1000, 2);
}
