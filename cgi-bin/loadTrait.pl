#!/usr/bin/perl -wTi
use CGI qw(:standard);
use DBI;
print "Content-type:text/html \n\n";

$modelo = param('modelo');

$hostname = 'localhost';
$port=3306;
$username='rcondori';
$password='kzw8x6qr';
$database='rcondori';
$dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
$dbh = DBI->connect($dsn,$username,$password) or die ("no se puede conectar");

$sth = $dbh->prepare("SELECT CarCod,CarNom from Caracteristicas  where CarMod=?");
$sth->execute($modelo);

print "<ul class='nav navbar-nav'>";
while(@res = $sth->fetchrow_array()){
  print<<HTML
  <li class="active"><a href="javascript:LoadAtr(@res[0])">@res[1]</a></li>
HTML
}
print "</ul>";

$dbh->disconnect();
