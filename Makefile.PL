use ExtUtils::MakeMaker 6.46;

WriteMakefile (
	NAME          => 'perlbench',
	ABSTRACT_FROM => 'lib/PerlBench.pm',
#	VERSION_FROM  => 'lib/PerlBench.pm',
	VERSION       => '0.94_01',
	EXE_FILES     => [
		qw(
			perlbench-timeit 
			perlbench-run 
			perlbench-runtests 
			perlbench-report
		  )
		],
	PREREQ_PM    => {
		'Time::HiRes'    => '0',
		'Getopt::Std'    => '0',
		'Sys::Hostname'  => '0',
		'File::Basename' => '0',
		'File::Path'     => '0',
		'Cwd'            => '0',
		},

	META_MERGE => {
		resources => {
			repository => 'https://github.com/briandfoy/perlbench',
			},
		no_index => {
			dir       => [ qw(benchmarks perlbench-results t) ],
			directory => [ qw(benchmarks perlbench-results t) ]
			namespace => 'Pod::HTML',
			}
		},
	);
