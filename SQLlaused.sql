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
('endru jak', '2022-12-30', '2562552', 90.5, 0),
('anno kivi', '2012-12-30', '2568122', 150.5, 0),
('ants pärt', '2010-12-30', '2545952', 245.5, 0);
select * from inimene;



delete from inimene
where inimeneID=3;
