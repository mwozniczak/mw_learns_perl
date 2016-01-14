my @dirs = qw(
  /usr
  /etc
  /bin
  /proc
);

my @sorted = sort {$b cmp $a} @dirs;
my ($first, $last) = (shift @sorted, pop @sorted);
print "First / last: $first / $last\n";

print "$_\n" for @sorted;

