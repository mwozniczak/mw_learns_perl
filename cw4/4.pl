$dir = shift @ARGV;
exec "ls -l $dir";
die "ŁOJEZUSMARIA: $!";
