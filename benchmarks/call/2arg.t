#!perl

# Name: Calling procedures
# Require: 4
# Desc:
#


require 'benchlib.pl';

sub foo
{
    $_[0] * $_[1];
}

&runtest(50, <<'ENDTEST');

   &foo(3, 4);

ENDTEST
