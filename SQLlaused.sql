--kommentaar
--xampp control panel
--Connect To:
--server name localhost - 127.0.0.1
-- Authethification :
-- kasutaja:root
-- parool: ei ole

CREATE DATABASE RazinkovLOGITpv23;
USE RazinkovLOGITpv23;

--tabeli loomine
--auto_increment - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary key auto_increment,
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
select* from inimene;

--tabeli kustutamine
drop table inimene;

--andmete lisamine
--DDL - data definition language
--DML - data manipulation language

insert into inimene(nimi, synniaeg, telefon, pikkus, opilaskodu)
values
('Mati Kaskk', '2021-12-30', '2568952', 90.5, 0),
('Anna Kivi', '2011-12-30', '2564952', 98.5, 0),
('endru jak', '2022-12-30', '2562552', 90.5, 0),
('anno kivi', '2012-12-30', '2568122', 150.5, 0),
('ants pärt', '2010-12-30', '2545952', 245.5, 0);
select * from inimene;



delete from inimene
where inimeneID=4;
--tabel elukoht
create table elukoht(
elukohtID int primary key auto_increment,
elukoht varchar(50) unique,
maakond varchar(50)
);
select * from elukoht;
--andmete lisamine tabeli elukoht
insert into elukoht(elukoht,maakond)
values ('Tartu','Tartumaa'),
('Pärnu','Pärnumaa');
--tabeli muutmine uue veergu lisamine
alter table inimene add elukohtID int;
select * from inimene;
--foreignh key lisamine
alter table inimene
add constraint fk_elukoht
foreign key (elukohtID) 
references elukoht(elukohtID);

select * from inimene;
select * from elukoht;

insert into inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
values
('Mati suur', '2021-12-30', '2568952', 90.5, 0, 3);

select inimene.nimi, inimene.synniaeg, elukoht.elukoht 
from inimene join elukoht
on inimene.elukohtID=elukoht.elukohtID

select i.nimi, i.synniaeg, e.elukoht 
from inimene i join elukoht e
on i.elukohtID=e.elukohtID
--tabel auto loomine
create table auto(
autoID int primary key auto_increment),
autonr varchar(7) unique,
mudell varchar(50),
mark varchar(50),
vaast char(10)
);

alter table inimene add autoID int;
alter table inimene
add constraint fk_auto
foreign key (autoID)
references auto(autoID);

select * from auto;

INSERT INTO auto
(autonr, mudell, mark, vaast)
VALUES ('turbos', 'tunning', 'porche', '2012-3-5')

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES ('turbo2', '2001-12-30', '091236543', 10.00, 0, 1, 1)

select i.nimi, a.vaast, a.mark, a.mudell
from inimene i join auto a
on i.elukohtID=a.autoID;
delete from auto
where autoID=1;
 Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `kaal` decimal(10,2) DEFAULT NULL,
  `tyypID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loom`
--

INSERT INTO `loom` (`loomID`, `nimi`, `kaal`, `tyypID`) VALUES
(2, 'kass', 3.00, NULL),
(3, 'kass', 3.00, 1);

-- --------------------------------------------------------


 Tabeli struktuur tabelile `tyyp`

CREATE TABLE `tyyp` (
  `tyypID` int(11) NOT NULL,
  `tyyp` varchar(50) DEFAULT NULL,
  `kirjeldus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--Andmete tõmmistamine tabelile `tyyp`

INSERT INTO `tyyp` (`tyypID`, `tyyp`, `kirjeldus`) VALUES
(1, 'Башкирский', 'оранжевый в полосочку');

-- Indeksid tõmmistatud tabelitele



-- Indeksid tabelile `auto`

ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`);


-- Indeksid tabelile `elukoht`

ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);


-- Indeksid tabelile `inimene`

ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_autoID` (`autoID`),
  ADD KEY `fk_loom` (`loomID`);


-- Indeksid tabelile `loom`

ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD KEY `fk_tyyp` (`tyypID`);


-- Indeksid tabelile `tyyp`

ALTER TABLE `tyyp`
  ADD PRIMARY KEY (`tyypID`);


-- AUTO_INCREMENT tõmmistatud tabelitele



-- AUTO_INCREMENT tabelile `auto`

ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


-- AUTO_INCREMENT tabelile `elukoht`

ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


-- AUTO_INCREMENT tabelile `inimene`

ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `tyyp`
--
ALTER TABLE `tyyp`
  MODIFY `tyypID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_autoID` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`),
  ADD CONSTRAINT `fk_loom` FOREIGN KEY (`loomID`) REFERENCES `loom` (`loomID`);

--
-- Piirangud tabelile `loom`
--
ALTER TABLE `loom`
  ADD CONSTRAINT `fk_tyyp` FOREIGN KEY (`tyypID`) REFERENCES `tyyp` (`tyypID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
