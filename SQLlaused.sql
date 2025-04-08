--kommentaar
--SQL SERVER Managment Stuudio
--Connect To:
--server name c:(localdb)\MSSQLLocalDB
-- Authethification 2 tüüpi:
--1.Windows Auth - localdb admini õigused
--2.SQL Server authification - kontrollida varem tehtud kasutajad

CREATE DATABASE RazinkovLOGITpv23;
USE RazinkovLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary key identity(1,1),
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
elukohtID int primary key identity(1,1),
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

create table auto(
autoID int primary key identity(1,1),
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
