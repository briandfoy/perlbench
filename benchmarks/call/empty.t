#!perl

# Name: Calling procedures without arguments
# Require: 4
# Desc:
#


require 'benchlib.pl';

sub foo {}
sub bar {}


&runtest(30, <<'ENDTEST');

   &foo;
   &bar;
   &foo;
   &bar;
   &foo;
   &bar;

ENDTEST
