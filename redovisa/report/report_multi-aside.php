<aside>
    <!-- Navigering med klass för att kunna stilge via CSS -->
    <nav class="navigation__multi">
        <ul class="navigation__multi--list">
        <!-- bygger undermenyns alternativ, baserat på ALLA indexerade key/value i arrayen $pages: -->
        <?php foreach ($pages as $key => $value) :
            // Skriver ut klassen SELECTED enligt vilkoret:
            // Definerar variabeln:
            $selected = null;
            // Skriver ut klassen SELECTED enligt vilkoret:
            if ($key === $pageReference) {
                $selected = "navigation__button--multi--selected";
            }
            ?>
            <!-- Det här är koden som skapas baserat på om tidigare vilkor uppfyllts, key/value styr länken som skapas: -->
            <li class="navigation__button--listItem"><a class="navigation__button--multi <?= $selected ?>" href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
        <?php endforeach; ?>
        </ul>
    </nav>
</aside>
  