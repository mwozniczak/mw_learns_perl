$oldest = (sort {-A $b <=> -A $a} @ARGV)[0];

print "$oldest jest najstarszy, ma ".((-A $oldest)|0)." dni.\n";
