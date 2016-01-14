print "Podaj katalog: ";
chomp ($dir = <STDIN>);
$dir =~ s/^\s+|\s+$//g;

if (!$dir) {
  $dir = $ENV{'HOME'};
}
-d $dir or die "Nie udało się :C\n";

for (<$dir/*>) {
  print "$_\n";
}
