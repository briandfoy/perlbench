#!perl

# Name: Traverse hash with foreach (sort keys %hash)
# Require: 4
# Desc:
#


require 'benchlib.pl';

$i = "abc";
for (1..50) {
    $hash{$i} = 1;
    $i++;
}
print "keys %hash = ", int(keys %hash), "\n";

&runtest(1, <<'ENDTEST');

   foreach $k (sort keys %hash) {
       $v = $hash{$k};
       # 
   }

ENDTEST
