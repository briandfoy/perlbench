#!perl

# Name: String interpolation
# Require: 4
# Desc:
#


require 'benchlib.pl';

$a = "xx" x 100;

&runtest(60, <<'ENDTEST');

   $b = "foo $a bar";
   $c = "$b 33";

ENDTEST
