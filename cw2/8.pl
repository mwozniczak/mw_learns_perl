#!/usr/bin/env perl
## Copyright © 2016 Michał Woźniczak
$^I = ".adamUciekaj";
while (<>) {
	s/adam/Zenon/i;
	print;
}
