print "Podaj katalog: ";
chomp ($dir = <STDIN>);

$dir = $ENV{'HOME'} if $dir =~ /^\s*$/;
-d $dir or die "Nie udało się :C\n";

print "$_\n" for (<$dir/*>);
