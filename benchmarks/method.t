#!perl

# Name: Calling methods
# Require: 5
# Desc:
#


require 'benchlib.pl';

package Foo;

sub foo
{
    $_[0] * $_[1];
}

package Bar;
@ISA=qw(Foo);

package main;

$bar = bless {}, "Bar";

&runtest(40, <<'ENDTEST');

   $bar->foo(3, 4);

ENDTEST
