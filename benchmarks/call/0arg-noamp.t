#!perl

# Name: Calling procedures
# Require: 5
# Desc:
#


require 'benchlib.pl';

sub foo
{
    @_ == 0;
}

&runtest(25, <<'ENDTEST');

   foo();
   foo();
   foo();

ENDTEST
