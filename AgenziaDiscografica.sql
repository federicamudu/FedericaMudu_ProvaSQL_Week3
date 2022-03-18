create database AgenziaDiscografica

create table Band(
IdBand int IDENTITY(1,1) not null constraint Pk_Band primary key,
Nome nvarchar(50) not null,
NumeroComponenti int not null 
)

create table Album (
IdAlbum int IDENTITY(1,1) not null constraint Pk_Album primary key,
Titolo nvarchar(40) not null,
AnnoUscita int not null,
CasaDiscografica nvarchar(20),
Genere nvarchar(20) not null constraint chk_genere check (Genere ='Classico'or Genere = 'Jazz' or Genere = 'Pop' or Genere = 'Rock' or Genere = 'Metal'),
SupportoDistribuzione nvarchar(20) not null constraint chk_supporto check (SupportoDistribuzione = 'CD' or SupportoDistribuzione = 'Vinile' or SupportoDistribuzione = 'Streaming'),
IdBand int not null,
constraint FK_IdBand foreign key (IdBand) references Band(IdBand)
)

alter table Album add constraint AlbumUnico unique (Titolo, AnnoUscita, CasaDiscografica, Genere, SupportoDistribuzione)


create table Brano(
IdBrano int IDENTITY(1,1) not null constraint Pk_Brano primary key,
Titolo nvarchar(40),
Durata int not null
)

create table BranoAlbum(
IdAlbum int not null,
IdBrano int not null,
constraint FK_IdAlbum foreign key (IdAlbum) references Album(IdAlbum),
constraint FK_IdBrano foreign key (IdBrano) references Brano(IdBrano)
)

--inserimento dati--

--inserimento band--
insert into Band values ('883', 2), ('Maneskin', 4), ('The Giornalisti', 3), ('Imagine Dragons', 5), ('John Lennon', 1)
select * from Band
--inserimento album--
insert into Album values ('Nord Sud Ovest Est', 1993, 'Fri Records', 'Pop', 'CD', 1), 
						('Il ballo della vita', 2018, 'Sony Music', 'Rock', 'Streaming', 2), 
						('Completamente Sold Out', 2016, 'Carosello', 'Pop', 'CD',3), 
						('Night Vision', 2012, 'Interscope Records', 'Rock', 'Vinile',4), 
						('Imagine', 1971, 'Apple/Emi', 'Rock', 'Vinile',5)
select * from Album
--inserimento brani--
insert into Brano values ('Il pappagallo', 202), ('Sei un mito', 304), ('Non ci Spezziamo', 184), ('Come mai', 250)
insert into Brano values ('New Song', 200), ('Torna a casa', 210), ('L''altra dimensione', 123), ('Sh*t Blvd', 193)
insert into Brano values ('Completamente', 201), ('Sold Out', 207), ('Tra la strada e le stelle', 240), ('L''ultimo grido della notte', 204)
insert into Brano values ('Radioactive', 184), ('Tiptoe', 188), ('It''s Time', 240), ('Demons', 153)
insert into Brano values ('Imagine', 180), ('Crippled Inside', 209), ('Jealous Guy', 249), ('It''s so hard', 136)
insert into Brano values ('Stan', 386), ('The Real Slim Shady', 266), ('Criminal', 310), ('Hailie''s Song', 312)
select * from Brano
--inserimento/collegamento tra brani e album--
insert into BranoAlbum values (1,1), (1,2),(1,3),(1,4)
insert into BranoAlbum values (2,5), (2,6),(2,7),(2,8)
insert into BranoAlbum values (3,9), (3,10),(3,11),(3,12)
insert into BranoAlbum values (4,13), (4,14),(4,15),(4,16)
insert into BranoAlbum values (5,17), (5,18),(5,19),(5,20)



--check sull'album il ballo della vita con supporto su CD
insert into Album values ('Il ballo della vita', 2018, 'Sony Music', 'Rock', 'CD', 2)



--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;

select b.Titolo
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
			join Band bd on bd.IdBand = a.IdBand
where bd.Nome ='883' 
order by b.Titolo



--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;

select distinct Titolo
from Album
where CasaDiscografica = 'Sony Music'


--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti
--ad album pubblicati prima del 2019;

select b.Titolo
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
			join Band bd on bd.IdBand = a.IdBand
where bd.Nome = 'Maneskin'


--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;

select a.Titolo
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
where b.Titolo = 'Imagine'

--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;

select bd.Nome, COUNT(b.Titolo) as [Totale Canzoni]
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
			join Band bd on bd.IdBand = a.IdBand
group by bd.Nome
having bd.Nome = 'The Giornalisti'

--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani

select a.Titolo, sum(b.Durata) as [Durata totale in secondi]
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
group by a.Titolo


--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i
--secondi quindi 180 s).

select distinct b.Titolo 
from Album a join BranoAlbum ba on a.IdAlbum = ba.IdAlbum
			join Brano b on ba.IdBrano = b.IdBrano
			join Band bd on bd.IdBand = a.IdBand
where b.Durata > 180 and bd.Nome = '883'

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.

select Nome
from Band
where Nome like 'M%' and Nome like '%n'

--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un
--Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.

select Titolo, case 
	when AnnoUscita < 1980 then 'Very Old'
	when AnnoUscita = 2021 then 'New Entry'
	when AnnoUscita between 2010 and 2020 then 'Recente'
	else 'Old'
	end as [Tipologia Album]
from Album


--10) Mostrare i brani non contenuti in nessun album

select Titolo
from Brano
where IdBrano not in (select IdBrano from BranoAlbum)
