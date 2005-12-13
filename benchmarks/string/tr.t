#!perl

# Name: Try the tr/// function
# Require: 4
# Desc:
#


require 'benchlib.pl';

@a = (0 .. 255);
for (@a) { $_ = sprintf("%c", $_) };
$a = join("",  @a);

&runtest(8, <<'ENDTEST');

   $a =~ tr/A-Z�-��-�/a-z�-��-�/;
   $a =~ tr/a-z�-��-�/A-Z�-��-�/;

   $a =~ tr/A-Z�-��-�/a-z�-��-�/;
   $a =~ tr/a-z�-��-�/A-Z�-��-�/;

ENDTEST
