#!perl

# Name: How long does it take to start the interpreter
# Require: 4
# Desc:
#


require 'benchlib.pl';

&runtest(0.0035, <<'ENDTEST');

    system $^X, "-e", "1";

ENDTEST
