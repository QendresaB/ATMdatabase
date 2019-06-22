
GO 
USE ATM_db
GO

-- *Një pyetësor ashtu që të dhënat të mirren nga një tabelë
--Emrin e klienteve me te rinje ne moshe

select Emri 
from Klientet
where mosha=
            (
			 select min(Mosha) AS Mosha
             from Klientet
			 ) 
			
-- *Dy pyetësorë ashtu që të dhënat të mirren nga dy tabela


--ID e atm shuma e parave ne te cilin eshte me e madhe se mesatarja e te gjitha shumave te transaksioneve qe jane kryer
select t.IDATM , a.ShumaParaveNeATM
from Transaksioni t join  ATM a
on t.IDATM=a.IDATM
group by t.IDATM ,a.ShumaParaveNeATM
having a.ShumaParaveNeATM > avg(shuma)   

-- ID e ATM qe eshte perdorur per transaksione me shume ose 2 here
	select t.IDATM , count(t.IDATM) as C
	 from 
	Transaksioni t join ATM a
	on t.IDATM = a.IDATM
	group by t.IDATM
	having count(t.IDATM) >=2   

-- *Tre pyetësorë ashtu që të dhënat të mirren nga tre tabela


--ID e klienteve qe kane bere me shume ose 3 transaksione te tipit deposit

select xh.IDKlienti , count(*) as [Numri i transaksioneve]
from Transaksioni tr join TN1 t
     on tr.IDTransaksioni=t.IDTranskasioni
         join Xhirollogaria xh
            on xh.IDXhirollogaria=t.IDXhirollogaria -- algjeber done
            group by xh.IDKlienti, tr.[Lloji i Transaksionit]
            having tr.[Lloji i Transaksionit] ='Deposit' and count(*)>=3   

-- Gjeje ID Xhirollogarine dhe ID e bankes , ATM e te ciles e ka perdor klienti ne rruge te ndryshme nga ajo 'Lesna'

SELECT t1.IDXhirollogaria,a.IDBanka 
FROM ATM a join Transaksioni t
     ON  a.IDATM= t.IDATM 
	 join TN1 t1
	 ON t1.IDTranskasioni=t.IDTransaksioni 
	 WHERE a.Adresa <>'Lesna'


-- Gjeje Emrin Mbiemrin e klientit ,gjendjen e llogarise dhe IDXhirolloagrin e atyre personave qe kan gjendjen e llogarise me te vogel se 1000

SELECT distinct k.Emri ,k.Mbiemri,x.GjendjaELlogarise,t.IDXhirollogaria
FROM Klientet k , Xhirollogaria x,TN1 t
WHERE k.IDKlienti = x.IDKlienti AND
	x.IDXhirollogaria= t.IDXhirollogaria AND
	x.GjendjaELlogarise <1000 


-- * Një pyetësor që merr të dhëna nga më shumë se tre tabela

--Gjeje Emrin Mbiemrin e klientit ,gjendjen e llogarise , IDTransaksioni , llojin e transaksionit , transaksionin e fundit , shumen e transaksionit dhe IDATM
--te klienteve qe kanë gjendjen e llogarise >0 dhe qe kanë kryer transaksionin e llojit të ndryshëm nga depozit

SELECT k.Emri ,k.Mbiemri,x.GjendjaELlogarise,t.IDTransaksioni,t.[Lloji i Transaksionit] AS [Transaksioni i fundit],t.Shuma AS [Shuma e transaksionit], a.IDATM
FROM Klientet k , Xhirollogaria x,Transaksioni t ,ATM a,TN1 n
WHERE k.IDKlienti = x.IDKlienti AND
	x.IDXhirollogaria= n.IDXhirollogaria AND
	n.IDTranskasioni=t.IDTransaksioni AND
	a.IDATM = t.IDATM AND
	x.GjendjaELlogarise >0 AND
	t.[Lloji i Transaksionit]<>'deposit'