<aside>
    <!-- Navigering med klass för att kunna stilge via CSS -->
    <nav class="navbar__multi">
        <ul class="navbar__multi--list">
        <!-- bygger undermenyns alternativ, baserat på ALLA indexerade key/value i arrayen $pages: -->
        <?php foreach ($pages as $key => $value) :
            // Skriver ut klassen SELECTED enligt vilkoret:
            // Definerar variabeln:
            $selected = null;
            // Skriver ut klassen SELECTED enligt vilkoret:
            if ($key === $pageReference) {
                $selected = "navbar__button--multi--selected";
            }
            ?>
            <!-- Det här är koden som skapas baserat på om tidigare vilkor uppfyllts, key/value styr länken som skapas: -->
            <li class="navbar__button--listItem"><a class="navbar__button--multi <?= $selected ?>" href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
        <?php endforeach; ?>
        </ul>
    </nav>
</aside>
  