my %last_name = qw{
 tomasz nowak anna Nowak Jan Zuba monika zuba
 Anna-Maria Zuba PATRYCJA NOWAK
};
sub by_names {
  if (lc $last_name{$a} cmp lc $last_name{$b}) {
    return lc $last_name{$a} cmp lc $last_name{$b};
  }
  return lc $a cmp lc $b;
}

my $current_lastname;
my $spaces;
for (sort by_names keys %last_name) {
  if (lc $last_name{$_} ne lc $current_lastname) {
    $current_lastname = $last_name{$_};
    print "$current_lastname:\n";
    $spaces = (length ($current_lastname) +2);
  }
  printf " " x $spaces . "$_\n";
}
