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
    $scale = 1 if $scale < 1;
    $point_factor = 1000 unless $point_factor;
    $code = <<EOT1 . $code . <<'EOT2';
\$before_r = time;
(\$before_u, \$before_s, \$before_cu, \$before_cs) = times;
for (\$i = 0; \$i < $scale; \$i++) {
   package main;
   #---- test code ----
EOT1
   #-------------------
}
($after_u, $after_s, $after_cu, $after_cs) = times;
$after_r = time;

$user   = ($after_u - $before_u) + ($after_cu - $before_cu);
$system = ($after_s - $before_s) + ($after_cs - $before_cs);
$real   = ($after_r - $before_r);
$used   = $user + $system;

print "CYCLES: $scale\n";
print "USER TIME: $user\n";
print "SYSTEM TIME: $system\n";
print "REAL TIME: $real\n";
printf "CPU: %.0f%%\n", 100*$used/$real if $real > 0;
if ($used > 0.1) {
    print "CYCLES/SEC: ", $scale / $used, "\n";
    if (defined $empty_cycles_per_sec) {
	$loop_overhead = $scale / $empty_cycles_per_sec;
	$p = 100 * $loop_overhead / $used;
        printf "LOOP OVERHEAD: %.1f%%\n", $p;
	$used -= $loop_overhead;
	print "ADJUSTED USED TIME: $used\n";
    }
    print "BENCH POINTS: ", $point_factor / $used, "\n";
}
EOT2

    if ($] >= 5.002) {
	$code = <<'EOT' . $code;
BEGIN {
    # If Time::HiRes is available, we can get better resolution
    eval {
        require Time::HiRes;
        Time::HiRes->import('time');
    };
}

EOT
    }

    print $code if $main'debug;
    eval $code;
    if ($@) {
        die $@;
    }
}

1;
