#!perl

# This test tries some mixed arithmetics

require 'benchlib.pl';

$x = 0;

&runtest(25, <<'ENDTEST');

    $x = ($x + 2) % 333;
    $z = $x / 40;
    $y = $x * 40580;
    $x = 3;
    $x++;
    $x += 1900;

ENDTEST
