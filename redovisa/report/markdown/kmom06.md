## Kmom06

*- Förklara begreppet index i databas för en nybörjare, berätta varför index är viktigt. Skriv ett kort stycke (3-7 rader).*

Indexering i en databas är ungefär som bokmärken eller innehållsförteckningen i en bok. Man skapar olika typer av index i de olika tabeller som är databasen, de kan vara nummer baserade index eller textbaserade index. När databashanteraren sedan använder de här olika indexeringarna kan man tänka sig hur det skulle vara att leta efter något i en bok, istället för att gå från framsida till baksida, sida efter sida blir det mycket effektivare att slå upp det man söker i innehållsförteckningen och sedan leta igenom de olika stycken som finns på ämnet man söker inom. Genom en bra utförd indexering av databasens tabeller ökar prestandan på databasen och desto fler välplacerade indexeringar man har per tabell, desto lättare och träffsäkrare kan förfrågningar mot databasen vara. Vidare här kan man tillsammans med den indexeringen och bättre ställda förfrågningar uppnå högre prestanda eftersom databashanteraren inte tvingas söka igenom lika mycket data för att hitta vad som förfrågas.

*- Berätta vilka extra index du tillförde i din eshop.*

I utgångsläget försökte jag ringa in de nycklar och värden som har ett unikt värde, gärna av numerisk typ. Många av dem är även primärnycklar i de tabellerna men om jag förstått det rätt så ska det inte vara ett hinder. Där det är möjligt har jag angett att det är en unik nyckel men jag tror att man kan upnå max en sådan per tabell. Beroende på tabellen och innehållet försökte jag självklart få in någon fulltext-index för att göra förfrågningar som en fritext sökning lättare och därmed öka på indexeringen av tabellen. Det varierar från tabell till tabell om det finns passande fulltext index att tilldela.

För tabellen products angav jag id som unikt index, name får både ett vanilgt index och ett fulltext index. Då info tillhör ett en opassande grupp av värden för index där man kan bedöma teckenstorleken som för bred annars funderade jag på att använda den. Det fick mig även att fundera på hur lång behöver en produkt information verkligen vara?

Product_types blir alla kolumer någon form av index, id blir det unika numeriska index, product blir ett vanligt index och type fulltext index. Jag tänker att eftersom vi använder kategorier i några olika förfrågningar i applikationen så kan det hjälpa oss att ange alla som är möjliga att använda.

Product_tables får tre index där id är det unika numeriskt index, text och alt blir fulltextindex. Jag var lite oklar med om en bildtext och alternativ beskrivningstext var bra indexering men lämnade det så med förhoppning att någon prestanda kanske kan uppnås. Många bäckar små kanske blir en stor å tänkte jag här.

Tabellen Inventory är en av de med flest nycklarna av alla tabeller och det är även en av de tabeller som databashanteraren arbetar mest mot i vår applikation. Jag har fem nycklar angivet där id är den unika numeriska nyckeln, section, position och level som utgör lagerplatserna är självklart indexerade och produkten är indexerad.

Customers är även en tabell som har många förfrågningar riktade mot sig så den har sex indexeringar. Id är det unika numeriska, firstname, lastname, street & email är tabellens fulltext indexeringar och sist är birthday som är en vanlig indexering. Det här kan vara en av de bättre indexerade tabellerna då den data som tabellen innehåller är fler unika per rad än i andra tabeller.

Picking lists blev något svårare att få till med indexering då jag försökte att använda tre men kunde endast använda ett. Jag fick ett problem när jag kör min data definition language fil som skapar tabellerna och lyckades inte komma runt problemet. Det slutliga blev endast id som ett unikt numeriskt index men jag tänkte även använda order och product då jag först tänkte att det skulle vara passande eftersom de används vid förfrågningar och transaktioner. Det visade sig under vidare läsning i kurslitteraturen att de här två tabellerna faller under vad som kallas dålig selektivitet eftersom de har många av samma värde.

Products to picking list får bara en indexering då det endast passar med id för de andra enkelt blir upprepade värden på fler rader i tabellen. Id passar precis som tidigare för att det är numeriskt och unikt men frågan jag funderar på är om det får någon effekt då id även är primärnyckel.

Orderstabellen har index på id , customer och picking list. Liknande tänk som tidigare där jag försöker hålla det numeriskt där det är möjligt. Nu antar jag att inte blir komplikationer med exempelvis kund id då en kund kan lägga fler beställningar men en avvägning bör göras och det är möjligt att det kan ses som opassande då det blir repeterande värden i samma kolumn med tiden.

Order from customer har endast id och customer så de används båda två som index.

I customer phones har jag endast angivit telefonnummret eftersom det är ett unikt värde och består av en bra sifferkombination.

I tabellen invioces finns endast id som är ett unikt numeriskt värde så det blir index här.

För tabellerna log_products och log_orders har jag angivit fyra index. Id, log_activity, log_before och log_after. Id är det unika numeriska värdet och det tre följande är fulltextindex. Det tre sista kanske kan bedömmas ligga på gränsen till för breda för att användas som index men jag körde endå.

Utifrån vad vi nu har lärt oss är en databas lite av ett levande ting och efter att den har satts i drift kan det behövas vidare utvärdering om detaljer som indexering då den data som databasen lagrar är avgörande.

*- Berätta kort hur du ser på nyttan med funktioner i databasen.*

Vill man inkludera kod som är lik andra programmeringsspråk för att göra exempelvis en if-sats eller annat, är en funktion ett gott alternativ. De är smidiga att använda på flera platser i koden och relativt lätta att skriva. Det gäller att vara kreativ och se möjligheten för en funktion och hur användbar den är men det är yttligare ett steg mot att skapa händelser per automatik i databasen utifrån den data som finns tillgänglig.

Det finns en parallell med lagrade procedurer där de delar liknande möjligheter och det gäller att avgöra och välja vad som är rätt till ändamålet. I min förståelse verkar procedurer vara mer lämpade för kod som ska köras av exempelvis webb-/terminalklienten (eller liknande) då det är enkelt att kalla på dem med en kort sql-sats. De passar även bra när en rad förfrågningar ska ske som ett flöde medan en funktion är ett snabbt och smidigt instick i exempelvis en vy som vi gjorde med orderstatus baserat på tidsstämplar. Det här säger inte att det är omöjligt att komplicera en funktion eller att det inte finns andra vis att inkludera dem utan mer en reflektion av hur jag nu upplever dem från vad vi har gjort här.

*- Kommentera arbetet med din eshop, är du nöjd eller finns förbättringspotential och hur tycker du svårighetsgraden har varit på uppgiften eshop som helhet?*

Jag är nöjd med min E-shop och arbetet har varit utmanande och roligt. Jag har lärt mig mycket under resans gång genom en rad olika problem som har uppstått under resans gång. Svårighetsgraden har varit medel med möjligheter att försvåra det så mycket man själv vill. Det är som vanligt att tid är det som avgör och kommer visa sig i resultatet, utan investerad tid kan man inte lära sig det där lilla extra. Jag uppskattar den form av arbete/projekt vi gör då jag ser att om man är en duktigt programmerare finns det möjligheter att skapa extra funktionaliteter lite som man tycker själv. Lärarna har via forumtrådar och andra tips hintat att det går att skapa exempelvis en login för användare men det får studenten själv läsa på och lösa eftersom det kan tyckas ligga lite utanför vad kursen ska hantera primärt. Det här är bara ett exempel men det visar på att det finns frihet att utvecklas vidare och det är väldigt bra. För oss resterande som inte ligger i framkanten är mallarna och vägledningen genom projektet mycket bra och jag tycker att övningarna är väl utformade för att man stegvis ska kunna ta till sig kunskap och bygga en eshop som den här.

Förbättringspotential finns alltid och jag tror att vi alla känner att ut med vår inlärningskurva lär vis oss lösningar på de närmsta problemen vi har men när den kunskapen har rotat sig lite börjar vi se även nästkommande steg och dess möjligheter. Strävan efter att bli bättre leder oss vidare upp för den här stegen och den växer både på höjd och bredd med den kunskap och erfarenhet vi skapar oss med tiden. Jag har under kursen gång gått från att i princip endast kunna "select * from ..." till vad projektet nu är och det känns som natt och dag.

I mitt projekt kan jag se en del förbättringspotential som exempelvis att skapa den inloggning jag nämnde för att separera kundanvändning mot operatörsanvändning. Vi kan jobba lite extra på att kunden möts av en lite mer välpolerad uta som hen uppskattar att orientera sig genom och beställa från. En riktig kundkorg och skulle vara en sak att förbättra, jag tänker på en sån som man oftast ser när man handlar på nätet. Informationen kan förbättras mycket då jag endast skrivit ihop saker för att det ska finnas något där för att påvisa hur det kan fungera. På operatör sidan kan man utveckla loggar bättre där jag tänker på ordrar, produkter och kunder främst sen vidare med fakturering. Jag har funderingar på hur statistik skulle kunna implementeras och användas för att presentera relevanta “extra” produkter för kunden men det kanske är ett nytt kapitel som gränsar i andra områden. Sen kan man alltid se över sina grunder och dubbelkolla sig själv så att man verkligen fixat till det på smidigast möjliga sätt, refaktorera koden och polera på sitt verk.

En sak jag tänkte på lite även om det kanske kräver en hel del extra arbete skulle vara att dela upp lagret i olika tabeller. Tanken skulle vara att om vi har ett större lager så är vissa platser mer plockvänliga än andra och för att det skulle kunna fungera behöver vi nog dela lagret i minst tre tabeller där de lägre är plockplatser och de högre sk påfyllnings platser. I det här så ska man nog även skapa en form av rest tabell där allt som inte kan plockas just nu från plock platserna läggs till och arbetarna som sysslar med att fylla på arbetar mot resttabellen och påfyllninsplatsernas tabell. Det börjar bli mycket mer här och det skulle innebära smartare funktionaliteter som kan bli komplicerat när vi gräver ner oss i detaljerna. Ett företag som driver större lager kan dock vara intresserade och kanske efterfrågar den här typen av funktionaliteter. Någonstans i detta kan även triggers som ger notiser när produkter börjar ta slut eller redan är slut så mer kan köpas in utan större fördröjning.

*- Berätta om någon extra sak du valde att göra i din eshop, om du gjorde något.*

Jag gjorde en logg för ordrar i webbklienten men känner att den kan utvecklas vidare eftersom det är nästan samma sak som produktloggen. Jag tycker dock att det är en bra ide att skapa en logg för ordrar med hjälp av triggers då mycket god information kan komma från en sådan om den är välbyggd.

Jag gick igenom krav 1 till 3 för eshop3 samt någon småsak extra och jag valde att göra det mer för övning och lärandets skull då jag finner databas som väldigt god kunskap att ha. I krav 1 ska man implementera log i webbklienten likt den som är i terminalklienten som visar 20 rader av logg från produktloggen. Man ska göra ett kommando till terminalklienten som heter loggsearch där man kan söka i logghistoriken. Eftersom jag såg kopplingen mellan webb- och terminalklient införde jag ett sökformulär även i webbklienten för både produkt- och orderlogg.

Krav 2 där man kan hantera och beställa sin order i webbklienten. Vidare kan man se en full översyn av ordern med kund- och orderdetaljer med en lista på beställda produkter. Det går även att se en plocklista och utifrån min egen erfarenhet av lager så lade jag till ett extra steg i orderstatusfunktionen “plockad”. Tanken är att ibland kan en beställning komma in men föreställ dig att exempelvis har dagens transporter redan gått iväg eller något liknande så produkterna behöver vänta på nästkommande transport, här kommer statusen in och håller personalen uppdaterad om att produkterna ligger paketerade och väntar på transport. Man kan även skicka ordern och jag gjorde ett försök på att se till att mina produkter minskas på lagret även om de är utspridda och behöver plockas från olika platser. Det fungerar som det är nu men funktionalitet som ser efter vart de plockas från saknas och möjligheten at kanske prioritera mer plockvänliga platser i ställagen saknas även. Här är jag medveten om att min funktion som gör urvalet bör ligga i funktionsmodulen och inte i cli-modulen men de problem jag mötte tog mycket tid att lösa och jag lämnade det som ni kan se.

Jag har implementerat min faktura i webbklienten för krav 3 med status för betalning, priser per orderrad och totalpriset för ordern. När ordern skickas till kund ändras status för om den är skickad eller ej och ett datum anges när den blev skickad. Man kan via terminalklienten "betala" eller ange att en order är betald ett visst datum.

*- Vilken är din TIL för detta kmom?*

Jag lärde mig om prestanda och hur index är relevant för att uppnå en bättre prestanda.

Jag har lärt mig skriva funktioner för en databas och övningen med statushantering var givande.

Jag blev bättre på att bygga och felsöka mina routes för webbklienten. Jag veta att detta tillhör tidigare kursmoment men projektet kräver att man om och om bygger sina routes som utför förfrågningar av olika slag. Det var god övning och jag tycker att eshop2 & 3 knyter ihop säcken på ett bra sätt.

Under både kmom05 & 6 tycker jag att helheten av databas-tänket fallit på plats bra och min förståelse av vad vi tidigare i kursen gjorde blir tydligare här. Kan inte riktigt ge exempel mer en känsla jag har som bevis på något vi nu lärt oss under en längre tid.
