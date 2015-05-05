#!/usr/bin/perl -wTi
use CGI qw(:standard);
use DBI;
print "Content-type:text/html \n\n";

$codigoCar = param('codigoCar');

$hostname = 'localhost';
$port=3306;
$username='rcondori';
$password='kzw8x6qr';
$database='rcondori';
$dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
$dbh = DBI->connect($dsn,$username,$password) or die ("no se puede conectar");

$sth = $dbh->prepare("SELECT (SELECT CarNom FROM Caracteristicas WHERE CarCod=?),AtrNom from Atributos");
$sth->execute($codigoCar);

while(@res = $sth->fetchrow_array()){
  print<<HTML
    <div class="panel-heading">@res[0] : @res[1]</div>
    <div class="panel-body"> 
      ingresar<input > </input>
    </div>
HTML
}

$dbh->disconnect();
