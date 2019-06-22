xquery version "1.0";
declare namespace ext="http://www.altova.com/xslt-extensions";
for $a in /ATMDatabase/ATM
for $b in /ATMDatabase/Transaksioni
where $a/@ID_ATM = $b/@ID_ATM  
return <ATM>
		{$a/(ID_ATM|ShumaEParaveNeATM)}
		{$b}
		</ATM>

