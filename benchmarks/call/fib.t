#!perl

# Name: Calling recursive procedures
# Require: 5
# Desc:
#


require 'benchlib.pl';

sub fib {
    $_[0] < 2 ? 1 : fib($_[0] - 2) + fib($_[0] - 1);
}

&runtest(0.1, <<'ENDTEST');

   $f = fib(12);

ENDTEST
