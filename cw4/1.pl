
for (@ARGV) {
  print "$_ ";
  if (!-e) {
    print "nie istnieje.\n";
  } else {
    print "istnieje, ";
    print "nie " x !-r . "można go czytać, ";
    print "nie " x !-w . "można do niego pisać.\n"
  }
}
