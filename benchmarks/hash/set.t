#!perl

# Name: Add keys to a hash
# Require: 4
# Desc:
#


require 'benchlib.pl';

$key = "abc";
for (1..1000) {
    $hash{$key} = 1;
    $key++;
}

&runtest(40, <<'ENDTEST');

   $a{$key} = 1;
   $a{$key} = 2;
   $key++;

ENDTEST
