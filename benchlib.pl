# This code runs on perl4.036 and newer perls.  Usage:
#
#   require 'benchlib.pl';
#   runtest(1000, <<'ENDTEST');
#       # some testing code here
#   ENDTEST

package benchlib;

$cpu_factor = shift;
if (!$cpu_factor) {
    die "No CPU factor specified\n";
}
$empty_cycles_per_sec = shift;

sub main'runtest
{
    local($scale, $code, $point_factor) = @_;
    $scale = int($scale * $cpu_factor);
    $point_factor = 1000 unless $point_factor;
    $code = <<EOT1 . $code . <<'EOT2';
\$before_r = time;
(\$before_u, \$before_s) = times;
for (\$i = 0; \$i < $scale; \$i++) {
   package main;
   #---- test code ----
EOT1
   #-------------------
}
($after_u, $after_s) = times;
$after_r = time;
$used = $after_u - $before_u;
print "CYCLES: $scale\n";
print "USER TIME: $used\n";
print "SYSTEM TIME: ", $after_s - $before_s, "\n";
print "REAL TIME: ", $after_r - $before_r, "\n";
if ($used > 0.1) {
    print "CYCLES/SEC: ", $scale / $used, "\n";
    if (defined $empty_cycles_per_sec) {
	$loop_overhead = $scale / $empty_cycles_per_sec;
	$p = $loop_overhead / $used * 100;
        printf "LOOP OVERHEAD PERCENTAGE: %.1f\n", $p;
	$used -= $loop_overhead;
	print "ADJUSTED USER TIME: $used\n";
    }
    print "BENCH POINTS: ", $point_factor / $used, "\n";
}
EOT2
    print $code if $main'debug;
    eval $code;
    if ($@) {
        die $@;
    }
}

1;
