use Math::Trig;
print "Promien: ";
my $r = <STDIN>;
my $c;

$c = 2*pi*$r;
print "Obwód: $c ";
printf "(Siakoś około %.2f)\n", $c;
