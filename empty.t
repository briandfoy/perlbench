#!perl

# Name: Empty loop
# Require: 4
# Desc:
#


require 'benchlib.pl';

&runtest(500, <<'ENDTEST');

    # no code

ENDTEST
