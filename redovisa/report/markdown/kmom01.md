# Kmom01

*- Berätta kort om den utvecklingsmiljö du sitter i och vilka databaser/klienter du installerat och vilka versioner de har.*  

Jag sitter i Mac OS och jag installerade först MariaDB för att det lät på Mikaels föreläsning som det naturliga valet om man sitter i Unix-miljö. Det var först och främst allt prat om hur open source för MySQL möljigen missköts en aning av de nuvarande ägare som fick mig att vilja göra det valet. Där efter fick jag inte igång det som förväntat så jag gick tillbaka och följde instruktionerna med mål att köra MySQL (v.15.1). Jag är fortfarande intresserad av att köra MariaDB av just den anledningen med open source men för nu kör jag MySQL och sen får vi se vart det bär av i framtiden. MySQL Workbech (v.8.0.19) är klienten/programmet vi använder för att skriva och köra SQL-kod i våra databas(filer/moduler). Paralellt med Workbech kör jag komandoklienten för MySQL i terminalen. Personligen gillar jag komandoradsklienten en aning mer när det kommer till att köra olika dokument med fler förfrågningar. Har jag exempelvis fler select-sater i min databas visas de en efter en i komandoradsklienten medans i workbech får jag den sista utskrivet. Det här kan vara en inställning eller ovana med Workbech men jag finner det lite irriterande eftersom jag vill ha full kontroll och se att inget nytt jag adderar förstör något sedan tidigare. Texteditor är VS Code och det funkar även att skriva min SQL där med men då måste jag köra .sql filen via någon av de andra två för att se vad som händer.

*- Hur känns det att komma igång med databaser, klienter och SQL?*

Det känns bra, kmom01 känns som en bra repetition på det vi gjorde i htmlphpkursen med lite extra detaljer som rör MySQL/MariaDB och självklart komandoradsklienten för MySQL/MariaDB. Vi har nu kört lite basic CRUD om jag inte misstar mig och ser fram imot vidare kunskaper innom databasteknik.

*- Har du jobbat med databaser eller liknande tidigare?*

Den enda erfarenhet jag har av databaser kommer från kursen htmlphp(webbteknologier) där vi haterade SQLite som är en filbaserad databas. Det poänterades under den kursen att SQLite är som lillebror till MySQL/MariaDB och nu ska det bli riktigt intressant att dyka in i en av två och lära sig mer om databasteknik.

*- Hur gick det att jobba med SQL i guiden?*

Guiden var väldigt bra och hanterade grundläggande CRUD på ett väldigt infromativt och logist sätt. Det var bra att färska upp små saker och komma igång med att skriva SELECT-sattser igen. Tycker även att guiden var bra för att göra setup och komma igång på alla delar förutom den lilla delen om $PATH som finns där. Det är något med $PATH i mitt system som strular till det och varje gång jag startar datorn måste jag nu köra ett komando i terminalen för att återställa orginal-PATH. Skulle uppskatta hjälp med att ställa in detta så jag slipper köra detta komando varje gång. Guiden i sin helhet gick smidigt förutom att jag förlorade massvis med tid på att försöka åtgärda det här problemet.

*- Jämför SQL med andra sätt att programmera.*

SQL är ett frågeställningsspråk (Strucktured Query Language) och utför opperationer mot en databaser och dess lagrade information. I min oerfarenhet av SQL så är jag lite osäker på vart gränserna för språket går men jag antar att man inte utför exempelvis skrivningar av funktioner, loopar och andra saker som är karaktäristiska för de flesta normala programmeringsspråk. Styrkan ligger i att skicka förfrågningar som skapar-, hämtar-, ändra- eller kanske tar bort(även kallat CRUD som står för Create Read Update Delete) information i databasen man hanterar. SQL är som en del man kan bädda in i andra typer av programmering för att hantera information som annars kan vara svår att hantera, speciellt om applikationen växer en aning. Ett annat programmeringsspråk skulle kunna användas för att bygga maskineriet som driver allt, skapar det visuella i färg, form och layout runt om den här informationen som hämtas från databasen  med SQL. Tillsammans blir det en kraftfull kombination som det går att skapa mycket användbara och intressanta saker med.

*- Vilken är din TIL för detta kmom?*

Jag har lärt mig/friskat upp minnet för hur jag skriver SQL-statements. Jag har lärt mig hur jag kommer igång med en MySQL-databas och något som liknar början till en grundläggande setup av den med olika typer av filer\(SETUP, DDL\(Data Directive Language) & DML(Data Manipulation Language\)\).
