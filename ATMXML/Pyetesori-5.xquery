xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $k in /ATMDatabase/Klientet,
$x in /ATMDatabase/Xhirollogaria,
$t in /ATMDatabase/TN1

where $k/@IDKlienti = $x/@IDKlienti
and $x/@ID_Xhirollogaria=$t/@ID_Xhirollogaria


return <Out>
		<Klientet>
			{$k}
		</Klientet>
		<Xhirollogaria>
			{$x}
		</Xhirollogaria>
		<TN1> 
			{$t}
		</TN1>
		</Out>

