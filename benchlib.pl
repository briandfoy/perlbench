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

sub main'runtest
{
    local($scale, $code, $point_factor) = @_;
    $scale = int($scale * $cpu_factor);
    $point_factor = 1000 unless $point_factor;
    $code = <<EOT1 . $code . <<'EOT2';
(\$before) = times;
for (\$i = 0; \$i < $scale; \$i++) {
   package main;
   #---- test code ----
EOT1
   #-------------------
}
($after) = times;
$used = $after - $before;
print "USER TIME: $used\n";
if ($used < 0.1) {
    print "BENCH POINTS: UNKNOWN\n";
} else {
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
