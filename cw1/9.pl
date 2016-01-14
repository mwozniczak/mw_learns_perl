sub fibo {
	if ($_[0] > 1476) {
		print "SIĘGNIESZ NIESKOŃCZONOŚCI PRZEBÓG ZASTANÓW SIĘ CO WYRABIASZ";
		<STDIN>;
	}
	my @results = (1, 1);
	for (3..$_[0]) {
		push(@results, $results[-1]+$results[-2]);
	}
	return @results;
};
print "Ile ma tego być? ";
@res = &fibo(scalar <STDIN>);
print "\n@res\n";