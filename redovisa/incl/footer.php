    <footer class="site__footer">
        <hr>
            <div class="site__footer--links">
                <p>Valideringsalternativ</p>
                <a href="http://validator.w3.org/check/referer" class="navi__button" target="_blank">HTML</a>
                <a href="http://jigsaw.w3.org/css-validator/check/referer" class="navi__button" target="_blank">CSS</a>
                <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance" class="navi__button" target="_blank">Unicorn</a>
            
                <p>Specifikationer</p>
                <a href="https://html.spec.whatwg.org/multipage/" class="navi__button" target="_blank">HTML5</a>
                <a href="https://www.w3.org/TR/CSS/" class="navi__button" target="_blank">CSS3</a>
                <a href="https://www.w3.org/2009/cheatsheet/" class="navi__button" target="_blank">Cheatsheet</a>
            </div>

            <p class="site__footer--pageLoader">
            Pagestats:
            <p class="site__footer--pageLoader"><?= getLoadedFiles() ?></p>
            <p class="site__footer--pageLoader">Page load time: <?= getPageLoadTime() ?>ms.</p>
        </p>
    </footer>
</body>
</html>