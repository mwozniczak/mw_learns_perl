print "W czym szukać: ";
my $str = <STDIN>;
chomp $str;
print "Czego szukać: ";
my $substr = <STDIN>;
chomp $substr;

my @spojniki_fanaberii = (
  ", a ponadto",
  " i",
  ", co więcej:",
  ", oprócz tego jeszcze",
  ", także w",
  ", też i");

my $pos = index $str, $substr;
if ($pos == -1) {
  print "smutnypuzon.wav :C\n"
}
else {
  print "Znaleziono na pozycji $pos";
  do {
    $pos++;
    $pos = index $str, $substr, $pos;
    if ($pos != -1) {
      my $s;
      do {
        $x = rand @spojniki_fanaberii;
        $s = $spojniki_fanaberii[$x];
      } while ($s eq $spojnik);
      $spojnik = $s;
      print "$spojnik $pos";
    }
  } while ($pos != -1 and $pos < length $str);
  print "\n"
}
