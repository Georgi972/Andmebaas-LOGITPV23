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
pikkis decimal(5,2),
opilaskodu bit
);
select* from inimene;

--tabeli kustutamine
drop table inimene;
