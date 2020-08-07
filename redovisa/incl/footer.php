    <footer class="site__footer">
            <p>Valideringsalternativ</p>
            <div class="site__footer--validationLinks">
                <a href="http://validator.w3.org/check/referer" class="navigation__button--footer" target="_blank">HTML</a>
                <a href="http://jigsaw.w3.org/css-validator/check/referer" class="navigation__button--footer" target="_blank">CSS</a>
                <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance" class="navigation__button--footer" target="_blank">Unicorn</a>
            </div>

            <p>Specifikationer</p>
            <div class="site__footer--specificationLinks">
                <a href="https://html.spec.whatwg.org/multipage/" class="navigation__button--footer" target="_blank">HTML5</a>
                <a href="https://www.w3.org/TR/CSS/" class="navigation__button--footer" target="_blank">CSS3</a>
                <a href="https://www.w3.org/2009/cheatsheet/" class="navigation__button--footer" target="_blank">Cheatsheet</a>
            </div>
            <div class="site__footer--pageLoaders">
                <p class="site__footer--pageLoaders-output">
                Pagestats:
                <p class="site__footer--pageLoader-output"><?= getLoadedFiles() ?></p>
                <p class="site__footer--pageLoader-output">Page load time: <?= getPageLoadTime() ?>ms.</p>
            </div>
        </p>
    </footer>

    <script type="text/javascript" src="js/viewportSize.js"></script>
</body>
</html>
