<div class="site__byline--outer">
    <div class="site__byline--inner">
        <figure>
            <img src="https://sv.gravatar.com/userimage/153143310/bb7ebc64d19973aac511c8badaf96a5c.jpg" alt="Avatar picture"  class="image__byline">
            <figcaption>Daniel Andersson</figcaption>
        </figure>
        <div class="site__byline--text">
            <?php
                $filename = __DIR__ . "/markdown/byline.md";
                $text     = file_get_contents($filename);
                $filter   = new \Anax\TextFilter\TextFilter();
                $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
                echo $parsed->text;
            ?>
        </div>
    </div>
</div>
