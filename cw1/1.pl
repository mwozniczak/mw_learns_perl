sub total {
  # my $ret = 0;
  $ret += $_ for @_;
  return $ret;
};
print total(10,9,8);

1;
