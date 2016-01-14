require "1.pl";

sub avg {
	&total(@_) / scalar @_;
};

sub above_avg {
	my @ret;
	$avg = &avg;
	for(@_) {
		push @ret, $_ if $_ > $avg;
	}
	return wantarray ? @ret : "@ret";
}
