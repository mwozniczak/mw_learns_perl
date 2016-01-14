@dirs = qw(
  /usr
  /etc
  /bin
  /proc
);

print "$_\n" for sort {$b cmp $a} @dirs

