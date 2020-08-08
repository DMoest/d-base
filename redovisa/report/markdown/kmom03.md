### Kmom03

*- Några generella reflektioner på att skriva och jobba med menydrivna terminalprogram i JavaScript och Node.js?*

Ett menyradsdrivet terminalprogram via node.js ger mig möjligheten att enkelt köra den javascriptfil som innehåller mitt program, användaren presenteras med en tydlig meny innehållande instruktioner på olika funktionaliteter som kan utföras. Jag bygger funktioner efter behov och resultatet blir att jag på ett enkelt sätt i terminalen använda mig av dem genom programmet jag har skapat. Jag blir effektivare eftersom det arbete jag vill utföra inte kräver mycket tid och det blir viktigare om det handlar om regelbundna interaktioner med programmets funktionaliteter. Jag kan genom ett bra programmeringsspråk nu göra min och andras interaktion med exempelvis databasen säkrare och möjligheten att skala upp mitt program efter behov i framtiden finns. För enklare och mer regelbundet arbete mot databasen behöver jag inte använda mig av mer avancerade verktyg som exempelvis är direkt kopplade till databasen och medför möjligheten att genom ett misstag förstöra data då mina funktioner är byggda väl och testade för ändamålet användaren önskar. Jag har nu påbörjat att bygga min egna lilla miljö som förenklar tillvaron i det vardagliga och på längre sikt kanske påbörjat något som kan överlämnas till en kund som står i behov av applikationer som är enklare att använda, förstå och automatisera delar av deras arbetsflöde med säkerhet. I slutenden blir det säkert sådant som avgör terminalprogrammets framtid, vem ska använda programmet, vilken nivå är den användaren på och vad ska det utföra åt den användaren?

*- Berätta om din kodstruktur i ditt terminalprogram mot databasen, är du nöjd eller ser du förbättringspotential?*

Mitt terminalprogram har fyra st filer varav tre är javascript-moduler och en är en JSON-fil med information som används av Node.js för interaktion mot databasen. I JSON-filen har jag sparat host, användare, lösenord för användaren, och databasens namn.

De tre Javascript-modulerna är index, functions och teachers. Index är min huvudmodul och där finns en komandoradsloop i form av en “IIFE” som från start av modulen körs och går om och om igen tills användaren avslutar terminalprogrammet. Det finns även en välkomsttext till användaren och en meny som kan presenteras för användaren med de olika alternativ som finns i programmet.

Modulen functions har precis som namnet antyder några funktioner som kan utföras. Mina funktioner är teachersAsTable(), teachersCompetenceAsTable(res) och teachersSalariesAsTable(res). De tre funktionerna gör utskrift av tabeller med information som hämtats från databasen.

Teachers-modulen innehåller ett objekt vid namn “teachers”. Teachers-objektet innehåller en rad objektspecifika funktioner. Det är de här funktionerna som skapar uppkoppling mot databasen, utför mina förfrågningar mot databasen, presenterar resultatet och avslutar kopplingen mot databasen.

För framtiden kan man säkert förbättra upplägget med en modul där man sparar alla förfrågningar (SQL-kod) och sedan importerar dem i modulen teachers. Det skulle möjligtvis bli lite lättare att överskåda modulen teachers på det viset även sortera förfrågningar efter deras olika funktionalitet. Jag är ganska nöjd med mitt terminalprogram men det behöver växa för att bli mer användbart med större funktionalitet och kontroll över min databas. Jag har förståelsen för att vi lär oss nu och det här är bara en liten del i det som behöver läras så jag ser fram emot att se det växa vidare.


*- Något att nämna kring det aktuella stycket i guiden skolan med till exempel outer joins och subqueries?*

Ett intressant stycke att arbeta med, det tog mer tid än tidigare delar av skolan att arbeta igenom. Subqueries verkar som det mesta vi lär oss, bra och användbart, men guiden poängterar att man i många fall kan skriva om en subquery till en UNION eller JOIN så när är att rekommendera det ena över det andra? (LEFT / RIGHT) OUTER JOINS var intressant men även det tog det en stund att greppa innan det var klart att det har med vilken tabell man utgår från och vad det har för effekt på resultatet.

Jag tyckte att delen med import av CSV/Excel -filer var intressant eftersom jag kan se det mycket användbart för Excel-vana företagare/kunder/personer. Jag tänker att många som anlitar en webbprogrammerare efterfrågar eller antar att den typen av funktionaliteter ska skapas för olika ändamål.

I övningen för återställningen av databasen (del3) försökte jag göra extrauppgiften där man ska skapa en excel-rapport och skapa en backup av databasen. Nu är inte jag den mest erfarne Excel-användaren men jag tror att man ska kunna skapa “tabbar/flikar” i Excel-dokument och min tanke var att lägga en tabell från min databas i en tab/flik men det gick inte som förväntat. Resultatet blev istället en excel-fil per tabell i databasen som kanske inte riktigt är bästa möjliga.


*- Hur gick det att jobba med ER-modelleringen, några reflektioner?*

Jag tycker att det gick bra även om det tog mer tid än väntat. Känslan är att jag nu har en bättre uppfattning av hur allt hänger samman i min databas. Det var nyttigt och jag gillar övningar som låter mig kladda lite på ett papper för att skapa en mall för vad jag behöver göra. Jag är lite osäker på ett av de senare kraven där jag ska “tänka igenom” mitt ER-diagram och försöka kolla så att “det håller ihop”. Jag tror att det håller som jag valt att göra och jag la lite extra tid på att försöka tänka igenom mina relationer i diagrammet när det kommer till hur de olika sidorna kan/inte kan vara del av varandra. Boken Databasteknik har varit till god nytta under kursmomentet och den växer på mig.

*- Fanns det några extra svårigheter/utmaningar du kämpade med i kursmomentet?*

Inga större svårigheter mer ett behov av att lägga mer tid än väntat på de olika delarna. Möjligtvis att jag behövde fundera igenom relationerna i ER-diagrammet en aning mer än de andra delarna.

*- Vilken är din TIL för detta kmom?*

Jag har lärt mig skapa ett konceptuellt ER-diagram för en databas som ska byggas. Diagrammet är en grund som byggs vidare på till en Logisk modell och sedan en Fysisk modell.

Jag har lärt mig bygga en komandoradsloop med javascript som blir grunden till ett menydrivet terminalprogram för hantering av en databas. Jag kör mitt program genom en fil med hjälp av node.js i terminalen och vipps så har jag en förenklad interaktion med min databas.

Importering/Exportering av data till/från Excel/CSV-dokument.
Lite mer om återställning och backup av en databas genom övningarna “skolan”. Inte helt säker på bash-koden som skrivs men det väcker intresse att lära mer bash.
