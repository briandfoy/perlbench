
use Benchmark;

$a = "A" x 200;
$b;

print "Fastes way to traverse a string (one character at a time):\n";

timethese( 2000, {

          #'regexp1' => 'while ($a =~ /(.)/gs) { $b = ord($1); }',
          #'regexp2' => 'while ($a =~ /./gs)   { $b = ord($&); }',
          #'regexp3' =>  '$_ = $a; while (length($_)) { s/^(.)//; $b = ord($1); }',
          #'regexp4'  =>  '$a =~ s/(.)/$b=ord($1); $1/ges',

	  'chop1'    =>  '$_ = reverse $a; while (length($_)) { $b = ord(chop($_)); }',
	  'chop2'    =>  '$_ = $a; while (length) { $b = ord(chop); }',
	  'chop2*'    =>  '$_ = reverse $a; while (length) { $b = ord(chop); }',
	  'chop3'    =>  'my $x = reverse $a; while (length($x)) { $b = ord(chop($x)); }',
	  'chop4'    =>  'my $x = reverse $a; my $len = length($x); my $i; for ($i = $len; $i; $i--) { $b = ord(chop($x)); }',


	  'split'   => 'for (split(//, $a))   { $b = ord($_); }',

	  'upack1'  => 'for (unpack("C*", $a)){ $b = ord(chr($_)); }',
	  'upack2'  => 'for (unpack("C*", $a)){ $b = $_; }',
	  'upack3'  => 'my $c = "C" x length($a); for (unpack($c, $a)){ $b = $_; }',

	  'substr1' => 'for my $i (1..length($a)) { $b = ord(substr($a, $i, 1)); }',
	  'substr2' => 'my $i; for ($i = 0; $i < length($a); $i++) { $b = ord(substr($a, $i, 1)); }',
	  'substr3' => 'my $i; my $len = length($a); for ($i = $len; $i; $i--) { $b = ord(substr($a, $i, 1)); }',
	  'vec' => 'my $i; my $len = length($a); for ($i = $len; $i; $i--) { $b = ord(chr(vec($a, $i, 8))); }',
	  #'substr*1' => 'my $i; my $len = length($a); for ($i = 0; $i < $len; $i++) { $b = $i }',
	  #'substr*2' => 'my $i; my $len = length($a); for ($i = $len; $i; $i--) { $b = $i }',
	  #'substr*3' => 'my $i; my $len = length($a); for ($i = $len; $i; --$i) { $b = $i }',

});

