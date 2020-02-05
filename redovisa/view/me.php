<?php require __DIR__ . "/../vendor/autoload.php"; ?>

<section class="content__me">
    <?php
        $filename = __DIR__ . "/markdown/me.md";
        $text     = file_get_contents($filename);
        $filter   = new \Anax\TextFilter\TextFilter();
        $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
        echo $parsed->text;
    ?>
</section>
