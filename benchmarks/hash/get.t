#!perl

# Name: Look up keys in a hash
# Require: 4
# Desc:
#


require 'benchlib.pl';

$i = "abc";
for (1..1000) {
    $hash{$i} = 1;
    $i++;
}
print "keys %hash = ", int(keys %hash), "\n";

&runtest(40, <<'ENDTEST');

   $a = $a{abc};
   $a = $a{abe};
   $a = $a{abf};
   $a = $a{abo};
   $a = $a{abn};

   $a = $a{abe};
   $a = $a{abf};
   $a = $a{abo};
   $a = $a{abn};

ENDTEST
