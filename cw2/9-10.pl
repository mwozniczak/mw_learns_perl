# $^I = ".bezprawie";

$/ = undef;
$copyright = "## Copyright © 2016 Michał Woźniczak";

while (<>) { 
	s/(#!.+?\n)/\1$copyright/m unless /$copyright/m;
	print
}
