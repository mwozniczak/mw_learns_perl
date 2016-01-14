
for (sort {$a <=> $b} @ARGV) {
  printf("%10s\n", $_);
}
