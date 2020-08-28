---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2019-05-31": "(A, mos) Examinationen 31 maj 2019."
...
Examination 31 maj 2019
=======================================

Detta är den individuella examinationen som är en del av kmom10.

<!--
Du kan läsa detta dokumentet i webbläsaren via länken "[Examination 31 maj 2019](https://dbwebb.se/kurser/databas-v1/kmom10/tentamen/bibliotek)"
-->

Uppgifterna skall lösas individuellt och du får inte prata, diskutera eller chatta med någon för att ta hjälp. Fråga läraren om något är oklart med uppgifterna. Om du är distansstudent så kan du använda kursens Gitter-kanal, eller forumet, för att ställa allmänna frågor till läraren.

Övriga hjälpmedel är tillåtna, inklusive egen dator, access till Internet och tillgång till tidigare kursmoment och ditt kursrepo.

Examinationen är begränsad till 5 timmar. 

Du kan maximalt få 30 poäng. Du behöver samla minst 18 poäng (60%) för att bli godkänd på tentamen. Samla fler poäng för att nå ett högre slutbetyg på kursen. 

<!--more-->


Du har troligen redan gjort `dbwebb exam checkout try2`.

Spara all kod i `me/kmom10/try2`.

Innan du börjar, läs igenom hela dokumentet så att du får en uppfattning om uppgifterna, poängfördelningen och vad uppgifterna omfattar.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har fått ett jobb i källaren på Kungliga Biblioteket och du jobbar i deras hemliga källare för att hantera böcker som har blivit klassificerade som icke läsbara för den stora allmänheten. Det är första veckan på jobbet och du vill framstå som en god databasprogrammerare.

Den ansvarige biblotikarien har gett dig [ett excelark med lite data](https://docs.google.com/spreadsheets/d/1H4TD8Xb7iSlhIdiHmVpd8UkQNQJM2_F-kW-pGDOVnYw/) och bett dig att göra "en databas" för de hemliga böckerna.

Excelarket innehåller fyra (4) flikar med data där varje flik är en tabell med kolumner och rader.

Du är redo, du har gjort sånt här förut, du tar datat från excelarket och påbörjar arbetet att bygga en databas, här tänker du glänsa.



Uppgift 1 (20p) {#u1}
---------------------------------------

Bygg en databas med en webbklient och en terminalklient.



### Kodstandard små bokstäver {#sma}

Kom ihåg att vi använder en rekommenderad kodstandard som säger små bokstäver på tabeller, vyer, procedurer, triggers och kolumnnamn, eventuellt separerade med understreck/underscore \_.

Vad du än gör, var noggrann och konsekvent i hur du använder stora/små bokstäver, annars riskerar du att din inlämning inte kan rättas.



### Generella krav {#generellt}

1. Din katalog innehåller en `package.json` med samtliga externa moduler som används.

1. Inloggningsdetaljer till databasen skall sparas i `config/db/exam.json`.

1. Javascript-kod som delas mellan klienterna, liksom extra moduler, placerar du i katalogen `src`.



### Databasmodell {#databasmodell}

Du tittar i Excelfilen och skapar dig en bild av informationen.

Det finns ett antal böcker med id, titel coh författare.

Det finns kategorier som anger varför en bok är bedömd som icke läsbar för allmänheten.

Det finns en koppling mellan böckerna och kategorierna, böckerna är klassificerade enligt en eller flera kategorier. Klassificeringen berättar varför boken är icke läsbar.

Det finns även en förteckning där respektive bok är angedd med en hyllplacering i bokhyllan, det är så att man kan hitta boken. Här anges även om boken är utlånad och vilket datum den skall lämnas tillbaka. Det finns enbart ett exemplar av varje bok.

1. Rita ett logiskt ER diagram över databasens tabeller. Spara diagrammet som `doc/er.pdf`.



### Databas {#databas}

Skapa databasen och fyll den med data.

1. SQL-filer lägger du i `sql/exam`. Skapa filen `setup.sql` för att skapa databasen och användaren. Låt din databas heta `exam` och ge användaren `user` full tillgång till databasen.

1. Skapa filen `ddl.sql` där du samlar all kod som skapar tabeller, vyer, procedurer, triggers och liknande. Använd den filen för att skapa databasens schema.

1. Skapa filen `insert.sql` med SQL-kod för att lägga in innehåll i tabellerna, motsvarande det som syns i Excelfilen. Innehållet kan du läsa in från CSV-filer eller manuellt via egenskapade INSERT-satser. CSV-filerna sparar du i samma katalog som sql-filerna (tänk på radbrytningar alá LF).

1. Om du skapar extra SQL-kod för att testa tabellerna, till exempel vanlig SELECT, så sparar du den koden i `dml.sql`.



### Webbklient {#webbklient}

Bygg en webbklient.

1. Skapa en webbklient med Express. Servern startas via `node index.js` och skall snurra på porten 1337.

1. Alla sidor skall ha en navigeringsdel så det går att klicka sig fram mellan sidorna, via navigeringen.

1. I webbklienten, skapa routen `/exam/index` som visar en välkomstssida. Välj själv vad du visar på förstasidan.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Skapa routen `/exam/visa` som visar en rapport med de böcker (id, titel, författare) som finns, på vilken hylla de är placerade, om de är utlånade eller inte (ange datum då de skall lämnas tillbaka) samt ange bokens klassificering (typ, anledning).

1. Lägg till länken i navbaren.



### Terminalklient {#terminalklient}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `visa` som visar en tabell med samma rapport som kan ses i webbklienten via länken `/exam/visa`.

1. Lägg till kommandot så det syns när man kör `menu`.



### Backup med lagrade procedurer {#backproc}

Skapa en backup av din databas och spara den i `sql/exam/backup.sql`.

Så här gör du för att få med de lagrade procedurerna.

```text
mysqldump -udbwebb -p --routines exam > backup.sql
# alterativt
mysqldump -udbwebb -p --routines --result-file=backup.sql exam
```

Om du använder en specifik CHARSET/COLLATION när du gör CREATE DATABASE, så behöver du ta din backup så här.

```text
mysqldump -udbwebb -p --routines --add-drop-database --databases exam > backup.sql
# alterativt
mysqldump -udbwebb -p --routines --add-drop-database --result-file=backup.sql --databases exam
```

Är din backup felaktig går det inte att rätta din inlämning.

Inspektera gärna din backupfil innan du känner dig nöjd (titta på den i texteditorn).



Uppgift 2 (5p) {#u2}
---------------------------------------

Chefen kommer förbi och hävdar bestämt att det behövs en sökfunktion i ditt verktyg som visar loggen. Man skall kunna söka på delsträngar i rapporten som du visat upp (författare, titel, kategori, anledning), eller på bokens id eller på hyllans id.

1. I webbklienten, skapa routen `exam/search` där man i ett formulär kan ange en söksträng. Visa samma rapport som du skapade tidigare, men visa enbart de rader som matchar söksträngen.

1. Lägg till länken i navbaren.

1. I terminalklienten, skapa kommandot `search <str>` som visar motsvarande.

1. Lägg till kommandot så det syns när man kör `menu`.



Uppgift 3 (5p) {#u2}
---------------------------------------

Denna uppgiften är lite svårare och kan tvinga dig att pilla lite extra med din SQL-konstruktion, kanske till och med googla lite ny information.

Chefen är stressad och sent på fredagseftermiddagen, typ kvart i fem, så kommer hen och ber dig att uppdatera databasen och dubbelklassifiera boken 3333 och lägga till så att den även är kategoriserad enligt kategorin 'myt' och sen ber hen om en mycket specifik rapport. Han säger "rapporten måste se ut EXAKT som den jag visar här". Du gör som chefen säger, även om rapporten ser aningen udda ut.

Studera utskriften nedan extra noggrant, skriv sedan SQL-kod som löser EXAKT samma rapport med EXAKT samma innehåll (samma rubriker, samma rader, samma ordning på raderna, samma innehåll i respektive kolumn).

Det är rapportens innehåll som är viktigt, inte hur du skriver ut det i tabellformatet, det är som vanligt godtyckligt tabellformat.

```text
+---------------------------------------------+----------------+------------+  
| Bok                                         | Klassificering | Utlånad    |  
+---------------------------------------------+----------------+------------+  
| Bankeryd  1976 - 1977 (Bilgruppen Femman)   | gdpr           | 2019-08-30 |  
| Bilbo - En Hobbits Äventyr (JRR Tolkien)    | myt & brott    |            |  
| Så länge vi båda andas (Stephenie Meyer)    | myt            |            |  
| Dåfinkar och Dönickar (Ulf Stark)           | brott          | 2019-06-25 |  
+---------------------------------------------+----------------+------------+  
```

1. I terminalklienten, skapa kommandot `rapport` som visar ovan rapport.



Inlämning {#inlamning}
---------------------------------------

Läs noggrant, checka av varje punkt innan du är klar.

1. Innan du lämnar in så skall du se till att din kod validerar via `dbwebb validate`. Varje valideringsfel ger normalt avdrag med 1 poäng.

1. Uppdatera din databasbackup i `sql/exam/backup.sql` så att den är aktuell.

1. Lämna slutligen in genom att göra `dbwebb exam seal try2`.

1. När du är helt klar så går du in på Canvas och "lämnar in" tentan genom att skriva "KLAR!" följt av din akronym. Om det är något särskilt som läraren behöver veta om din inlämning så skriver du det.

Vid problem, gör en `dbwebb upload` och maila sedan mos@bth.se och berätta vad som hänt och ange ditt namn och studentakronym.
