use ExtUtils::MakeMaker;

WriteMakefile (
   NAME    => 'perlbench',
   VERSION => '0.01',
   dist    => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
