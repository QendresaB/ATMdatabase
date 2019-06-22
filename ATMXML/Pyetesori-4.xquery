xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $a in /ATMDatabase/Xhirollogaria
for $b in /ATMDatabase/TN1
for $c in /ATMDatabase/Transaksioni
where $a/@ID_Xhirollogaria = $b/@ID_Xhirollogaria 
and $b/@ID_Transaksioni=$c/@ID_Transaksioni
return <Out>
		<Xhirollogaria>
			{$a/(GjendjaELlogarise)}
		</Xhirollogaria>
		<TN1>
			{$b/(Valuta)}
		</TN1>
		<Transaksioni>
			{$c/(Shuma)}
		</Transaksioni>
		</Out>
