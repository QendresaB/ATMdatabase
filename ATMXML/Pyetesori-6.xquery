xquery version "1.0";

declare namespace ext="http://www.altova.com/xslt-extensions";

for $t1 in /ATMDatabase/TN1,
$t in /ATMDatabase/Transaksioni,
$a in /ATMDatabase/ATM

where $t1/@ID_Transaksioni = $t/@ID_Transaksioni
and $t/@ID_ATM=$a/@ID_ATM

return <Out>
		<TN1>
			{$t1}
		</TN1>
		<Transaksion>
			{$t}
		</Transaksion>
		<ATM>
			{$a}
		</ATM>
		</Out>

