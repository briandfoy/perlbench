
use Benchmark;


print "Fastes loop with counter\n";

$i = 0;
$b = 0;


run(5);
run(50);
run(500);
run(5000);
run(50000);
run(500000);

sub run {
    local($no) = shift;
    print "Loops counting to $no\n";

    timethese( 1000000 / $no, {

	  'for1' => 'for ($i = 0; $i < $no; $i++)     { $b = $i  }',
	  'for2' => 'my $i; for ($i = $no; $i; $i--)  { $b = $i  }',
	  'for3' => 'for ($i = $no; $i; $i--)         { $b = $i  }',
	  'for4' => 'for ($i = $no; $i; --$i)         { $b = $i  }',

	  'foreach1' => 'for $i (1 .. $no)            { $b = $i  }',
	  'foreach2' => 'foreach $i (1 .. $no)        { $b = $i  }',
	  'foreach3' => 'foreach my $i (1 .. $no)     { $b = $i  }',
	  'foreach4' => 'foreach (1 .. $no)           { $b = $_  }',

	  'grep'  => 'grep { $b = $_; 0 } 1 .. $no',
	  'map'   => 'map { $b = $_; () } 1 .. $no',

	  'while1' => 'my $i = $no; while ($i) { $b = $i; $i-- }',
	  'while2' => 'my $i = $no; while ($i) { $b = $i; } continue { $i-- }',
	  'redo'   => 'my $i = $no; LOOP: { last unless $i; $b = $i; $i--; redo }',

      });

}
