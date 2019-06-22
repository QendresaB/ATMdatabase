CREATE DATABASE ATM_db
GO 
USE ATM_db
GO

CREATE TABLE Klientet(
IDKlienti INT PRIMARY KEY,
Emri VARCHAR(20) NOT NULL ,
Mbiemri VARCHAR(20) NOT NULL ,
Mosha INT check (Mosha >=18) not null
)
INSERT INTO Klientet VALUES(123,'Agon', 'Gashi',20);
INSERT INTO Klientet VALUES(124,'Ermir', 'Zeka',20);
INSERT INTO Klientet VALUES(125,'Alma','Bardhi', 18);
INSERT INTO Klientet VALUES(126 ,'Egzon' ,'Ahmeti',19);
INSERT INTO Klientet VALUES(127,'Petrit','Musa',28);
INSERT INTO Klientet VALUES(128,'Albion', 'Blakaj',20);
INSERT INTO Klientet VALUES(129,'Vesa', 'Bujupo',20);
INSERT INTO Klientet VALUES(130,'Fatjona','Rraci', 18);
INSERT INTO Klientet VALUES(131 ,'Dardan' ,'Alidemaj',29);
INSERT INTO Klientet VALUES(132,'Luan','Musa',42);

CREATE TABLE Banka(
IDBanka INT PRIMARY KEY,
Emri VARCHAR(30) NOT NULL,
Vendi VARCHAR(30) NOT NULL
)

INSERT INTO Banka VALUES(1,'NLB' ,'Prishtinë');
INSERT INTO Banka VALUES(2,'Raiffeisen' ,'Prizren');
INSERT INTO Banka VALUES(3,'Procredit' ,'Gjilan');
INSERT INTO Banka VALUES(4,'TEB' ,'Prishtinë');
INSERT INTO Banka VALUES(5,'Banka Ekonomike' ,'Prishtinë');
INSERT INTO Banka VALUES(6,'NLB' ,'Prizeren');
INSERT INTO Banka VALUES(7,'Raiffeisen' ,'Podujevë');
INSERT INTO Banka VALUES(8,'Procredit' ,'Gjilan');
INSERT INTO Banka VALUES(9,'TEB' ,'Gjilan');
INSERT INTO Banka VALUES(10,'Banka Ekonomike' ,'Istog');

CREATE TABLE ATM(
IDATM INT PRIMARY KEY,
IDBanka INT FOREIGN KEY REFERENCES Banka,
DataEVendosjes DATE,
Adresa VARCHAR(20) NOT NULL,
ShumaParaveNeATM MONEY check (ShumaParaveNeATM>=0)
)


INSERT INTO ATM VALUES(1234,1,GETDATE(),'Menza e studenteve',50);
INSERT INTO ATM VALUES(1235,2,GETDATE(),'Lesna',100);
INSERT INTO ATM VALUES(1236,3,GETDATE(),'Sheshi Skenderbeu',75);
INSERT INTO ATM VALUES(1237,1,GETDATE(),'Bregu i diellit',80);
INSERT INTO ATM VALUES(1238,1,GETDATE(),'Posta e madhe',10);
INSERT INTO ATM VALUES(1239,1,GETDATE(),'Menza e studenteve',10);
INSERT INTO ATM VALUES(1240,2,GETDATE(),'Lesna',20);
INSERT INTO ATM VALUES(1241,3,GETDATE(),'Sheshi Skenderbeu',20);
INSERT INTO ATM VALUES(1242,2,GETDATE(),'Bregu i diellit',15);
INSERT INTO ATM VALUES(1243,3,GETDATE(),'Posta e madhe',45);


CREATE TABLE Xhirollogaria(
IDXhirollogaria INT PRIMARY KEY ,
GjendjaELlogarise money,
IDKlienti INT REFERENCES Klientet
)

INSERT INTO Xhirollogaria VALUES(521,2000,123);
INSERT INTO Xhirollogaria VALUES(756,0,124);
INSERT INTO Xhirollogaria VALUES(345,100,125);
INSERT INTO Xhirollogaria VALUES(545,3500,126);
INSERT INTO Xhirollogaria VALUES(456,20,127);
INSERT INTO Xhirollogaria VALUES(551,2000,128);
INSERT INTO Xhirollogaria VALUES(766,250,129);
INSERT INTO Xhirollogaria VALUES(385,1200,130);
INSERT INTO Xhirollogaria VALUES(595,3500,131);
INSERT INTO Xhirollogaria VALUES(436,240,132);

CREATE TABLE Transaksioni(
IDTransaksioni INT PRIMARY KEY,
[Lloji i Transaksionit] VARCHAR(30), check ([Lloji i Transaksionit] in('Deposit','Terheqje')),
IDATM INT FOREIGN KEY REFERENCES ATM,
Shuma MONEY check (Shuma >=0),
DataETransaksionit DATE
)

INSERT INTO Transaksioni VALUES ( 1,'Terheqje',1234, 220,GETDATE());
INSERT INTO Transaksioni VALUES ( 2,'Terheqje',1235, 20,GETDATE());
INSERT INTO Transaksioni VALUES( 3,'Deposit',1234, 400,GETDATE());
INSERT INTO Transaksioni VALUES( 4,'Terheqje',1243, 50,GETDATE());
INSERT INTO Transaksioni VALUES( 5,'Deposit',1238, 200,GETDATE());
INSERT INTO Transaksioni VALUES ( 6,'Deposit',1239, 30,GETDATE());
INSERT INTO Transaksioni VALUES ( 7,'Terheqje',1235, 100,GETDATE());
INSERT INTO Transaksioni VALUES( 8,'Deposit',1240, 40,GETDATE());
INSERT INTO Transaksioni VALUES( 9,'Terheqje',1241, 50,GETDATE());
INSERT INTO Transaksioni VALUES( 10,'Deposit',1242, 200,GETDATE());

CREATE TABLE TN1(
IDTranskasioni INT REFERENCES Transaksioni,
IDXhirollogaria INT REFERENCES Xhirollogaria,
Valuta VARCHAR(4),
PRIMARY KEY(IDTranskasioni,IDXhirollogaria))


insert into TN1 values( 1,521,'USD');
insert into TN1 values( 2,756,'GHF');
insert into TN1 values( 3,456,'EUR');
insert into TN1 values( 1,545,'USD');
insert into TN1 values( 5,456,'FRA');
insert into TN1 values( 1,551,'USD');
insert into TN1 values( 3,766,'EUR');
insert into TN1 values( 2,385,'GHF');
insert into TN1 values( 5,595,'FRA');
insert into TN1 values( 10,456,'USD');

--URDHERAT:
--Për shtimin e një fushe në njërën nga tabelat
Alter Table Klientet ADD Gjinia VARCHAR(1);

--Për përditësimin e një të dhëne në njërën nga tabelat
UPDATE ATM
set ShumaParaveNeATM =100
where IDATM =1234
--Për fshirjen e një rreshti në njërën nga tabelat
delete from TN1
where Valuta like 'U%'


--Delete from TN1;
--Delete from Transaksioni
--Delete from Xhirollogaria
--Delete from Klientet
--Delete from ATM
--Delete from Banka

--Drop table TN1;
--Drop table Transaksioni
--Drop table Xhirollogaria
--Drop table Klientet
--Drop table ATM
--Drop table Banka

--SELECT * FROM ATM,Transaksioni,Banka,Klientet,Xhirollogaria,TN1
