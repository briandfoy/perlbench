package PerlBench::Utils;

use strict;
use base 'Exporter';
our @EXPORT_OK = qw(sec_f);

my %TIME_UNITS = (
    "h" => 1/3600,
    "min" => 1/60,
    "s" => 1,
    "ms" => 1e3,
    "µs" => 1e6,
    "ns" => 1e9,
);

my @TIME_UNITS =
    sort { $b->[1] <=> $a->[1] }
    map  { [$_ => $TIME_UNITS{$_}] }
    keys %TIME_UNITS;

sub sec_f {
    my($t, $d, $u) = @_;
    my $f;
    if (defined $u) {
	$f = $TIME_UNITS{$u} || croak("Unknown unit '$u'");
    }
    else {
	for (my $i = 1; $i < @TIME_UNITS; $i++) {
	    if ($t < 1/$TIME_UNITS[$i][1]) {
		($u, $f) = @{$TIME_UNITS[$i-1]};
		last;
	    }
	}
	unless ($u) {
	    ($u, $f) = @{$TIME_UNITS[-1]};
	}
    }

    my $dev = defined($d) ? 1 : "";
    $d = $t unless $dev;
    $d = abs($d);

    if ($f != 1) {
	$_ *= $f for $t, $d;
    }

    my $p = 0;
    if ($d < 0.05) {
	$p = 3;
    }
    elsif ($d < 0.5) {
	$p = 2;
    }
    elsif ($d < 5) {
	$p = 1;
    }

    $dev = sprintf(" ±%.*f", $p, $d) if $dev;
    return sprintf("%.*f %s%s", $p, $t, $u, $dev);
}

1;
