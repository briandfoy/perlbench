#!perl

# Name: Array assignment
# Require: 4
# Desc:
#


require 'benchlib.pl';

@a = (1..200);

&runtest(1, <<'ENDTEST');

    @b = @a;
    @c = @b[1..10];

ENDTEST
