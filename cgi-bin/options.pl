#!/usr/bin/perl
use CGI qw(:standard);
print "Content-type: text/html\n\n";
$lista = param('lista');
@lista1=('a','b','c');
@lista2=(1,2,3);
if($lista eq "lista1"){
 print "<select name=combo id=combo>";
 foreach my $value (@lista1){
 print "<option>";
 print $value;
 print "</option>\n";
 }
 print "</select>";
 
}

if($lista eq "lista2"){
        print "<select name=combo id=combo>";
        foreach my $value (@lista2){
               print "<option>";
               print $value;
               print "</option>\n";
        }
        print "</select>";
}
