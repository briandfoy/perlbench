# This is really only used to make a distribution file.

use ExtUtils::MakeMaker;

WriteMakefile (
   NAME    => 'perlbench',
   VERSION => '0.06',
   dist    => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);


sub MY::test
{
    return <<'EOT';

test:
	@echo "No tests.  You might want to run the 'bench' program."

EOT
}
