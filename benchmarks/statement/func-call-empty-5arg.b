# Name: Call an empty function
# Repeat: 20

sub empty {
   my($a, $b, $c, $d, $e) = @_;
   # do nothing
}

### TEST

empty("foo", 12, "bar", undef, 13);

