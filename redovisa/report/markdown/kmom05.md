## Kmom05

*- Gick det bra att komma igång med lagrade procedurer och triggers?*

Det gick bra, lite klurigt var det men intressant. Kraftfulla verktyg och jag märkte av lite av vad varningen under föreläsningen handlade om då jag lyckades koda in att någon av mina procedurer skulle lägga till i tabellen “account” som är från övningsexemplen. Eftersom det inte finns en sådan tabell i min databas var det ju självklart fel och det tog onödigt mycket tid för en ovan databasprogrammerare som jag att hitta felet. Annars var det väldigt intressant och inspirerande att se hur procedurer och triggers kan användas och se dem i ett aktivt arbete, jag antar att det här var bara början på den där magin som det talades om.

*- Hur är din syn på att “programmera” på detta viset i databasen, jämför med traditionell SQL som exponeras i klienten?*

Klurigt som tidigare sagt då jag finner SQL-syntax svårare att få till rätt på ett snabbt och bra sätt. Jag upplever även felmeddelandena svåra att tyda ibland då de ibland pekar på raden proceduren startar istället för någon rad längre ner där felet kan vara. Det här är iaf min känsla men det är som tidigare även sagt, väldigt kraftfulla verktyg som även underlättar koden i våran JS-applikation så det är bara att kämpa vidare.

*- Skriv ett kort stycke (2-5 meningar) om lagrade procedurer och om triggers där du förklarar begreppen (fördel, nackdel, användningsområde) för en som inte är insatt.*

Lagrade procedurer möjliggör flöden av förfrågningar mot en databas som senare kan användas enklare i API:er eller andra databashanterare som hanterar databasens data. Man kan utföra transaktioner exempelvis som kan vara ett flöde där minus görs på ett ställe följt av ett plus på ett annat ställe följt av en commit eller en rollback som säkerställer att det gjorts på rätt sätt. Man kan inkludera annan programmeringskod i en lagrad procedur som exempelvis if-satser för att göra vägval baserat på värden i vår data. Med hjälp av lagrade procedurer blir det enklare att sköta det vanligare då koden som kör dem är mycket kortare, likt en förprogrammerad funktion som är vanliga i programmeringsspråk. En trigger är som en lyssnande funktion som endast gör något om den förändringen som det lyssnas efter utförs. Triggers är ett bra sätt att bygga en tabell som loggar så vi får en utskrift från händelser/förändringar i databasen. Man kan även ta det längre där man utför automatiska förändringar baserat på händelser i databasen.

*- Något att kommentera kring arbetet med att komma igång och implementera CRUD i webbklienten?*

Jag tycker det var en väldigt bra föreläsning av Kenneth där han gick igenom hur olika routes fungerar med GET och POST via formulär. Lite kladdigt är det som ovan att gå igenom de olika modulerna, speciellt vid felsökning. Samtidigt så är det på detta vis vi lär oss som bäst med tiden. När ideerna om hur det fungerar faller på plats var det inte så svårt. Jag lyckades skapa mina routes som sköter GET och POST requests från formuläret som vi behöver för att göra skapandet, uppdaterande och raderandet av data.

*- Berätta om hur det gick att utföra uppgiften med din Eshop, berätta även vem du jobbade i grupp med, om någon?*

Jag har jobbat ensam eftersom jag är distansstudent. Uppgiften var bra men ganska stor vid första överblick. Den tog lite mer tid än väntat men inte orimligt mycket. När jag fick upp lite fart gick det lättare än först väntat men pga mängden olika krav på både webbklient och terminalklient tog det som sagt en del tid att gå igenom. Mycket lärorik uppgift ser fram emot att bygga vidare på det.

*- Vilken är din TIL för detta kmom?*

Jag har lärt mig vad lagrade procedurer och triggers är i SQL. Jag har via övningsexemplen fått använda dem och även se att det kan vara aningen svårare att felsöka dem.

Jag har lärt mig CRUD via lagrade procedurer och även skapa en enkel trigger för att lyssna på tabeller. Triggern skriver till en logg för tabellen där jag senare kan se vad som sker i min databas. Loggningen sker vid skapande, uppdaterande och raderande av produkter i min produkttabell.

Jag insåg även vikten av att formulera mig med kortare attribut/kolumnnamn och även använda engelska. Eftersom det blir mycket drygare att använda värdena senare i min applikation med långa namn ändrade jag på dem och eftersom jag ändå ändrade på dem ändrade jag till engelska eftersom jag läst om det i boken och det passar bättre då våran kodstandard även förbjuder tecken “åäö”. Det blev lite mer arbete men jag tycker även det blev bra i slutet.
