#!perl

# Name: Searching for a variable string using index()
# Require: 4
# Desc:
#


require 'benchlib.pl';

$a = "xx" x 100;
$b = "foobar";

&runtest(100, <<'ENDTEST');

   $c = index($a, $b);

ENDTEST
