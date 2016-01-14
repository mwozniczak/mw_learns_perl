
for (@ARGV) {
  print "$_ ";
  if (!-e) {
    print "nie istnieje.\n";
  } else {
    print "istnieje, ";
    print "nie " if !-r;
    print "można go czytać, ";
    print "nie " if !-w;
    print "można do niego pisać.\n"
  }
}
