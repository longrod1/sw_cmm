#!/usr/bin/perl -wTi
use CGI qw(:standard);
use DBI;
print "Content-type:text/html \n\n";

$hostname = 'localhost';
$port=3306;
$username='administrador';
$password='admin123';
$database='sw_cmm';
$dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
$dbh = DBI->connect($dsn,$username,$password) or die ("no se puede conectar");

$sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS Modelos( ModCod INT NOT NULL, ModNom varchar(30), PRIMARY KEY(ModCod))engine=innoDB");
$sth->execute();

$sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS Caracteristicas( CarCod INT NOT NULL, CarMod INT NOT NULL, CarNom varchar(30), PRIMARY KEY(CarCod), INDEX(CarMod),Foreign key(CarMod) REFERENCES Modelos(ModCod))engine=innoDB");
$sth->execute();


$sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS Atributos( AtrCod INT NOT NULL, AtrCar INT NOT NULL, AtrNom varchar(30), PRIMARY KEY(AtrCod), INDEX(AtrCar),Foreign key(AtrCar) REFERENCES Caracteristicas(CarCod))engine=innoDB");
$sth->execute();

$sth = $dbh->prepare("SELECT ModCod,ModNom from Modelos");
$sth->execute();

while(@res = $sth->fetchrow_array()){
print<<HTML;
  <option value="@res[0]">@res[1]</option>
HTML
}

$dbh->disconnect();
