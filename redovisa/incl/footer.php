    <footer id="site-footer">
        <hr>
            <div class="footer__links">
                <p>Valideringsalternativ</p>
                <a href="http://validator.w3.org/check/referer" class="small__button" target="_blank">HTML</a>
                <a href="http://jigsaw.w3.org/css-validator/check/referer" class="small__button" target="_blank">CSS</a>
                <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance" class="small__button" target="_blank">Unicorn</a>
            
                <p>Specifikationer</p>
                <a href="https://html.spec.whatwg.org/multipage/" class="small__button" target="_blank">HTML5</a>
                <a href="https://www.w3.org/TR/CSS/" class="small__button" target="_blank">CSS3</a>
                <a href="https://www.w3.org/2009/cheatsheet/" class="small__button" target="_blank">Cheatsheet</a>
            </div>
    </footer>

    <p class="footer__pageLoader">
        Pagestats:
            <p class="footer__pageLoader"><?= getLoadedFiles() ?></p>
            <p class="footer__pageLoader">Page load time: <?= getPageLoadTime() ?>ms.</p>
    </p>

<!-- php-taggen
    // $timestampFirst = $_SERVER["REQUEST_TIME_FLOAT"];
    // echo "$timestampFirst\n";
    
    // $timestampLast = microtime(true);
    // echo "End: $timestampLast\n";

    // $diff = $timestamLast - $timestampFirst;
    // echo "Diff: $diff\n";

    // $memoryMax = memory_get_peak_usage();
    // $memoryCurrent = memory_get_usage();
    // $memoryLimit = int_get("memory_Limit");
    // echo "Memory\n";
    // echo "Max: $memoryMax\n";
    // echo "Current: $memoryLimit\n";

    // $filesIncludeed = get_included_files();
    // $numFiles = count($filesIncluded);
    // echo "Files included: $numFiles\n"; -->



    <!-- Tidigare lektion(kmom02)
    php-taggen
    $numFiles = count(get_included_files());
    
    $memoryUsed = round((memory_get_peak_usage(true)) / 1000, 2);
    
    $loadTime = round(microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'], 3);
    ?>

    <p class="footer__pageLoader">Time to load page: <?= $loadTime ?> ms. Files included: <?= $numFiles ?>. Memory used: <?= $memoryUsed ?> kb.</p>
    <p> Copyright © 2019 Daniel Andersson, daap19@student.bth.se</p> -->

</body>
</html>