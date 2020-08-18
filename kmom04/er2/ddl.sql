-- DV1606, Databasteknologier för webben VT20
-- Daniel Andersson, DAAP19
-- Module: ddl.sql
-- Module content: All DDLs for the database, tables & views.



-- Drop tabels if exists:
drop table if exists fakturor;
drop table if exists aktivitetslogg;
drop table if exists orderlista;
drop table if exists order_fran_kund;
drop table if exists kundtelefoner;
drop table if exists kunder;
drop table if exists produkter_till_plocklista;
drop table if exists plocklista;
drop table if exists produktkategorier;
drop table if exists produktbilder;
drop table if exists lager;
drop table if exists produkter;

-- Drop views if exists:



-- Teckenkodning:
set names 'utf8';



-- Tables:
-- ----------

-- Produkter:
-- Fyra attribut-> produktnr., produktnamn, produktinfo., pris.
-- Primärnyckel produktnr.
create table produkter
(
    produktnummer int unique not null,
    produktnamn varchar(30) not null,
    produktinformation varchar(500) not null,
    pris float not null,

    primary key (produktnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe produkter;
-- show create table produkter \G;



-- Produktkategori:
-- Två attribut-> produktnr., kategori.
-- Primärnyckel produktnr.
create table produktkategorier
(
    produktnummer int not null,
    kategori varchar(30) not null,

    primary key (produktnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe produktkategorier;
-- show create table produktkategorier \G;



-- Produktbilder:
-- Tre attribut-> produktnr., produktbild, bildtext.
-- Primärnyckel produktnr.
create table produktbilder
(
    produktnummer int not null,
    produktbild varchar(30) not null,
    bildtext varchar(100) not null,

    primary key (produktnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe produktbilder;
-- show create table produktbilder \G;



-- Lager:
-- Fyra attribut-> id, section, position, niva.
-- primärnyckel id
create table lager
(
    id int unique not null,
    sektion char(2) not null default 'AA',
    position char(2) not null default '01',
    niva char(2) not null default '01',
    produktnummer int not null,
    saldo int not null,

    primary key (id),
    foreign key (produktnummer) references produkter(produktnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe lager;
-- show create table lager \G;



-- Kunder:
-- Tio attribut-> kundnr., fornamn, efternamn, gatunamn, nr., postnr., stad, land, email, fodelsedatum.
-- Primärnyckel kundnr.
create table kunder
(
    kundnummer int unique not null,
    fornamn varchar(20) not null,
    efternamn varchar(20) not null,
    gatunamn varchar(20) not null,
    nummer varchar(6) not null,
    postnummer varchar(10) not null,
    stad varchar(25) not null,
    land varchar(25) not null,
    email varchar(40) not null,
    fodelsedatum date not null,

    primary key (kundnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe kunder;
-- show create table kunder \G;


-- Plocklista:
-- Sex attribut-> id, plockindex, produktnr., produktnamn, lagerplats, antal.
-- Primärnyckel id.
-- Främmande nycklar, produktnr., lagerplats.
create table plocklista
(
    id int not null,
    plockindex int unique not null,
    produktnummer int not null,
    produktnamn varchar(30) not null,
    lagerplats int not null,
    antal int not null,

    primary key (id),
    foreign key (produktnummer) references produkter(produktnummer),
    foreign key (lagerplats) references lager(id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe plocklista;
-- show create table plocklista \G;


-- Produkter_till_plocklista:
-- Tre attribut-> produktnummer, plocklista, antal
-- Primärnyckel plocklista
-- Främmande nyckel produktnummer
create table produkter_till_plocklista
(
    plocklista int not null,
    produktnummer int not null,
    antal int not null,

    primary key (plocklista),
    foreign key (produktnummer) references produkter(produktnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe produkter_till_plocklista;
-- show create table produkter_till_plocklista \G;



-- Orderlista:
-- Fem attribut-> ordernr., kundnr., plocklista, datum, orderstatus.
-- Primärnyckel ordernr.
-- Främmande nyckel kundnr., plocklista.
create table orderlista
(
    ordernummer int unique not null,
    kundnummer int not null,
    plocklista int not null,
    datum date not null,
    orderstatus varchar(20) not null,

    primary key (ordernummer),
    foreign key (kundnummer) references kunder(kundnummer),
    foreign key (plocklista) references plocklista(id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe orderlista;
-- show create table orderlista \G;


-- Order från kund:
-- Två attribut-> ordernr., kundnr.
-- Primärnyckel ordernr.
-- Främmande nyckel kundnr.
create table order_fran_kund
(
    ordernummer int unique not null,
    kundnummer int not null,

    primary key (ordernummer),
    foreign key (kundnummer) references kunder(kundnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe order_fran_kund;
-- show create table order_fran_kund \G;



-- Kundtelefoner:
-- Två attribut-> kundnr., telefonnummer.
-- Primärnyckel kundnr.
create table kundtelefoner
(
    kundnummer int not null,
    telefonnummer int unique not null,

    primary key (kundnummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe kundtelefoner;
-- show create table kundtelefoner \G;



-- Fakturor:
-- Sex attribut-> fakturanr, ordernr, kundnr, packsedel, adress, fakturastatus.
-- Primärnyckel fakturanr.
-- Främmandenycklar, ordernr., kundnr., packsedel.
create table fakturor
(
    fakturanummer int unique not null,
    ordernummer int not null,
    kundnummer int not null,
    packsedel int not null,
    adress varchar(30) not null,
    fakturastatus varchar(20) not null,

    primary key (fakturanummer),
    foreign key (ordernummer) references orderlista(ordernummer),
    foreign key (kundnummer) references kunder(kundnummer),
    foreign key (packsedel) references plocklista(id)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

describe fakturor;
-- show create table fakturor \G;



-- Aktivitetslogg:
-- Fem attribut-> id, ordernr., datum, tid, aktivitet.
-- Primär nyckel, id.
-- Främmande nyckel, ordernummer.
create table aktivitetslogg
(
    id int unique not null,
    ordernummer int not null,
    datum date not null,
    tid time not null,
    aktivitet varchar(200) not null,

    primary key (id),
    foreign key (ordernummer) references orderlista(ordernummer)
)
engine innodb
charset utf8
collate utf8_swedish_ci
;

-- describe aktivitetslogg;
-- -- show create table aktivitetslogg \G;



-- VIEWS:
-- -----------
