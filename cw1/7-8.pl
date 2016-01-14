
sub columnize {
	my @items = split " ", shift;
	my $col_width = defined ($_[0]) ? $_[0] : 20;

	printf "%*s", $col_width, $_ for (1..scalar @items);
	print "\n";
	printf "%*s", $col_width, $_ for @items;
	print "\n";
}

columnize(scalar <STDIN>);