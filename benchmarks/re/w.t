#!perl

# Name: Regexp matching /(\w+)/
# Require: 4
# Desc:
#


require 'benchlib.pl';

$a = ("-" x 100) . "foo" . ("-" x 100);

&runtest(50, <<'ENDTEST');

   $a =~ /(\w+)/

ENDTEST
