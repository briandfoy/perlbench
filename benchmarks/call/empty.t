#!perl

# Name: Calling procedures
# Require: 4
# Desc:
#


require 'benchlib.pl';

sub foo
{
}

&runtest(70, <<'ENDTEST');

   &foo;

ENDTEST
