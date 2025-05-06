--trigerid
--sql triger (trigger) - protsess
--mille abil tema sisse
--kirjutatud tegevused automaatselt käivitatakse


--insert / updte / delete triggerid 
--mis jalgivad antud tegevused tabelites
--ja kirjutavab logi tabeli miida nad jalgisid
create database trigerLOGI;
use trigerLOGI

create table toode(
toodeID int primary key identity(1,1),
toodeNimetus varchar(25),
toodeHind decimal(5,2))
--taabel logi, mis täidab triger
create table logi(
id int primary key identity(1,1),
tegevus varchar(25),
kuupaev datetime,
andmed text)

--insert triger, mis jalgib andmete lisamine toode tabelis
create trigger toodelisamine
on toode
for insert 
as
insert into logi(tegevus, kuupaev, andmed)
select 'toode on lisatud',
GETDATE(),
inserted.toodeNimetus
from inserted;

drop trigger toodelisamine;

--kontroll
insert into toode(toodeNimetus, toodeHind)
values ('Coca-Cola3', 2.20);

select * from toode;
select * from logi;

--delete triger mis jalgib toode kustutamine tebelis
create trigger toodeKustutamine
on toode
for delete
as
insert into logi(tegevus, kuupaev, andmed)
select 'toode on Kustutatud ',
GETDATE(),
concat(deleted.toodeNimetus, ' tegi kasutaja ', SYSTEM_USER)
from deleted;
--kontroll
delete from toode
where toodeID=3;
select * from toode;
select * from logi;

--update triger mis jalgib toode uuendamine tabelis

CREATE TRIGGER toodeUuendamine
ON toode
FOR UPDATE
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on uuendatud',
GETDATE(),
CONCAT ('Vanad andmed  - ',  deleted.toodeNimetus,',  ',deleted.toodeHind,
'Uued andmed  - ', inserted.toodeNimetus,',  ',inserted.toodeHind,
 ' / tegi kasutaja ', SYSTEM_USER)
FROM deleted INNER JOIN inserted
ON deleted.toodeID=inserted.toodeID;

--kontroll
update toode set toodeHind=41.00
where toodeNimetus='Fanta'
select * from toode;
select * from logi;

