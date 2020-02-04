<aside>
    <!-- Navigering med klass för att kunna stilge via CSS -->
    <nav class="navbar--multi">
        <ul>
        <!-- bygger undermenyns alternativ, baserat på ALLA indexerade key/value i arrayen $pages: -->
        <?php foreach ($pages as $key => $value) :
            // Skriver ut klassen SELECTED enligt vilkoret:
            // Definerar variabeln:
            $selected = null;
            // Skriver ut klassen SELECTED enligt vilkoret:
            if ($key === $pageReference) {
                $selected = "class=\"selected small__button small__report\"";
            }
            ?>
            <!-- Det här är koden som skapas baserat på om tidigare vilkor uppfyllts, key/value styr länken som skapas: -->
            <li><a <?= $selected ?> class="small__button" href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
        <?php endforeach; ?>
        </ul>
    </nav>
</aside>
