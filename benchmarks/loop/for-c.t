#!perl

# Name: for ( ; ; ) loop
# Require: 4
# Desc:
#


require 'benchlib.pl';

&runtest(0.02, <<'ENDTEST');

    for ($_ = 1; $_ <= 10_000; $_++) {
	$foo = $_;
    }

ENDTEST
