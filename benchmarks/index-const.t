#!perl

# Name: Searching for fixed strings
# Require: 4
# Desc:
#


require 'benchlib.pl';

$a = "xx" x 100;

&runtest(100, <<'ENDTEST');

   $c = index($a, "foobar");

ENDTEST
