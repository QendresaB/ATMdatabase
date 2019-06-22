xquery version "1.0";
declare namespace ext="http://www.altova.com/xslt-extensions";
for $a in /ATMDatabase/Banka
for $b in /ATMDatabase/ATM
where $a/@IDBanka = $b/@IDBanka
return <Banka>
		{$a/(IDBanka|BEmri)}
		{$b}
		</Banka>

