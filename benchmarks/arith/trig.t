#!perl

# Name: Call some random trig functions
# Require: 4
# Desc:

require 'benchlib.pl';

$x = 0.23;

&runtest(25, <<'ENDTEST');

  $a = sin($x);
  $b = cos($a);
  $c = cos(sin($a) + cos($b) + atan2($x, $x));

  $a = sin($x);
  $b = cos($a);
  $c = cos(sin($a) + cos($b) + atan2($x, $x));

ENDTEST
