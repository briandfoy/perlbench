#!perl

# Name: Array assignment
# Require: 4
# Desc:
#


require 'benchlib.pl';

@a = (1..30);

&runtest(15, <<'ENDTEST');

   foreach $e (@a) {
       #$a = $e;
   }

ENDTEST
