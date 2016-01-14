print "Podaj regexy (pusta linia kończy):\n";
my @regexen;
my $item;
do {
  $item = <STDIN>;
  chomp $item;
  push @regexen, $item if $item gt ' ';
} while ($item);

$/ = undef;
open($plik, "<", "text.txt");
$tekst = join "", <$plik>;

sub countEm {
  $count = () = ($tekst =~ /$_/gm);
  print "'$_' zeżarło $count razy\n";
}

@res = map countEm, @regexen;
