### Kmom04

*- Hur gick det att förstå konceptet transaktioner i databas?*

Teoretiskt tycker jag att det har gått bra, det finns väl beskrivet i kursliteraturen och föreläsningen var bra gällande hur man ska tänka över att hantera sin data genom transaktioner mot en databas. ACID-Transaktioner, betydelsen av att hålla sina datatransaktioner odelbara, konsistenta, isolerade och hållbara var ganska rakt på och logiskt i min mening. Den praktiska delen är jag dock inte helt säker på, exakt hur man ska kontrollera transaktionerna och göra avgörandet mellan att commit eller rollback. Mikael sa på föreläsningen att det kommer under nästa kursmoment så jag räknar med att vi rör vid det avgörande tillfället då. För nu har jag endast hårdkodat in start transaction följt av förfrågning och sist commit.

*- Gick det bra att komma igång med Express.js, Node, EJS och MySQL?*

Det gick bra, installationen var som en dans i jämförelse med andra installationer, Kenneth gav en god föreläsning för hur man implementerar verktygen med kod och övningarna var bra och väl beskrivna som vanligt. Ska tillägga att genom det här kursmomentet har min förståelse för vad ett templating språk är blivit bättre genom EJS och föreläsningen, även om det var kort så blev det tydligare. Express.js för en webbklient mot databas var även mycket intressant.

*- Lyckas du med god kodstruktur för terminal och webbklient, du såg att man kunde göra en enda funktion som löste flytten av pengar åt båda hållen?*

Möjligheten finns att man kanske kan slå det samman även bättre mellan terminalklienten och webbklienten än vad jag har gjort. Känslan är dock bra och jag är nöjd med vad jag har åstadkommit strukturmässigt. Jag lyckades använda mig av samma funktion från en modul för de två klienterna. Till en börja gjorde jag två men när slutklämmen kom på plats blev det en av dem. Jag lyckades även med någon av extrauppgifterna där man kan skapa en array och från den input användaren ger sedan utföra transaktionen med indexerade värden från den array vi skapat. Taget från föregående kursmoment när vi söker efter olika lärarlöner mm. men det blev en bra lösning utifrån vad jag kan så här långt.

*- Gick det bra att sluföra uppgiften om ER modellering samt skapa SQL-kod för databasen?*

Det gick bra och jag är nöjd med min ER-modell för databasen eshop. Uppgiften var väldigt bra och förståelse ingivande. För min del gick jag in utan en översikt för hur det här ska komma att spela ut sig för att en databas ska kunna skapas och senare funktionellt användas. Den har även påvisat att det kan uppstå problem mellan hur man i teorin under det konceptuella stadiet tänker att det ska fungera och behöver se ut till hur det faktiskt behöver se ut och fungera som i det logiska och fysiska stadiet av modelleringen. Nu är det ganska klart att det kan alltid uppstå problem senare och mycket kan komma att ändras när kraven på en databas förändras men med den här processen för ER-modellering har vi tagit höjd för lite och står med en bättre databas i utgångspunkt som även kanske förebygger några möjliga problem.

*- Hur känner du allmänt inför kursen så här långt?*

Jag tycker att kursen är väldigt bra och skapar en god förståelse för databaser så här långt. Vi har lärt oss en hel del användbar SQL-kod som skapat förståelse för hur vi utför skapandet av databaser, användare, återställningsscript och en uppsjö av förfrågningar mot databasen vi nu skapat med det. Vi har även byggt vidare på förståelsen av allt med att ta en databas från konceptuellt modell där vi “tänker” hur det ska fungera till att översätta våra tankar till en logisk modell med hur det behöver fungera för att uppfylla de tänkta kraven vi ställer på databasen och sist påbörjat att bygga den fysiska modellen som är en databas från den SQL-kod som vi tidigare lärt oss.

Vidare så gillar jag hur kursen har relaterade uppgifter som inkluderar branchrelevanta verktyg som node.js och nu även Express som webbserver för databaser. Min uppfattning är att vi får en god grund att stå på när det gäller att förstå hur professionella webbprogrammerare tar sig an vardagliga uppgifter som krävs för att skapa moderna webbaserade system. Vi håller ett högt tempo för inlärningen och även om vi som studenter kanske inte använder exakt de här verktygen när vi når ut i arbetsliven så har vi fått förståelse för hur man lär sig de verktyg man behöver och förhoppningsvis blir då övergången till dem lättare. 

Jag känner även att med inkluderingen av de här verktygen har min förståelse för JavaScript förbättras en aning vilket är bra eftersom jag tidigare/ibland tycker att det känns kladdigt och svårare att greppa än de andra programmeringsspråken vi använder i utbildningen. Svårt att sätta fingret på eakt varför men det är en bra känsla när vinden vänder i rätt riktning en liten stund. Tack för det!

*- Vilken är din TIL för detta kmom?*

Min förståelse för databaser har blivit tydligare genom den Er-Modellering vi nu har utfört. Jag har lärt mig översätta den konceptuella modell jag tidigare skapat till en logisk modell som även tagit en fysisk form och är nu en tom databas redo att lagra data för min eshop. Det har visat mig några problem i skapandet av databaser som kan uppstå mellan hur man tänker till hur man behöver göra för att uppnå det önskade resultatet.

Jag tycker även att kapitlen om normalisering var god läsning som komplimenterar översättningen från konceptuell- till logisk modell på ett bra sätt. Jag har tagit en snabbare koll på det jag gjort för databasen och försökt använda det men jag tänker att mer arbete kan göras på den biten.

Det här kursmomentet har givit mig en bättre förståelse för vad ett templatingspråk som EJS är, likt Jinja i ooPython kursen. Det var inte lika tydligt för mig tidigare men även om det var kort förklarat så fick jag känslan av att det blev lite tydligare genom användningen i det här kursmomentet.

Jag har blivit lite bättre på JavaScript och hur Express.js används genom övningarna och uppgiften “flytta pengarna”. Tycker det är roligt att lära sig olika nya verktyg även om vi kanske bara lär oss en lite del av vad de är kapabla till. Jag försökte mig även på någon av hjälpfunktionerna som finns via länken för “multipla query statments” i artikeln för uppgiften men utan framgång så jag får ge den en revansch inom en snar framtid istället.

Jag ska även passa på att tacka Niklas som hjälpte mig med några detaljer i uppgiften, snabb och bra vägledning till att lösa problemet jag satt med. Stort tack för hjälpen!
