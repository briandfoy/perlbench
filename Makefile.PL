# This is really only used to make a distribution file.

use ExtUtils::MakeMaker;

WriteMakefile (
   NAME    => 'perlbench',
   VERSION => '0.03',
   dist    => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
