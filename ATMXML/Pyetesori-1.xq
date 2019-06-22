xquery version "1.0";

for $i in /ATMDatabase/Klientet
let
$x := $i/Emri
where $i/Mosha=18
return $x
