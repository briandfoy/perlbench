#!perl

# Name: Start perl with a few modules
# Require: 5
# Desc:
#


require 'benchlib.pl';

&runtest(0.01, <<'ENDTEST');

    system $^X, "-e", "use Getopt::Std; use Text::ParseWords; use File::Find; 1";

ENDTEST
