xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $k in /ATMDatabase/Klientet, 
$x in /ATMDatabase/Xhirollogaria, 
$t in /ATMDatabase/Transaksioni, 
$a in /ATMDatabase/ATM,  
$t1 in /ATMDatabase/TN1 


where $k/@IDKlienti = $x/@IDKlienti
and $x/@ID_Xhirollogaria=$t1/@ID_Xhirollogaria
and $t1/@ID_Transaksioni = $t/@ID_Transaksioni
and $a/@ID_ATM = $t/@ID_ATM


return <Output> 
		<Klientet>
			{$k/(Emri|Mbiemri)}
		</Klientet>
		<ATM>
		   {$a}
		</ATM>
		</Output>