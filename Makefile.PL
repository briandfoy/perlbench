use strict;
use warnings;

my $github    = 'https://github.com/briandfoy/perlbench';
my $main_file = 'lib/PerlBench.pm';

WriteMakefile (
	'NAME'          => 'perlbench',
	'ABSTRACT_FROM' => $main_file,
	'VERSION_FROM'  => $main_file,
	'VERSION_FROM'  => 'lib/PerlBench.pm',
	'EXE_FILES'     => [
		qw(
			perlbench-timeit 
			perlbench-run 
			perlbench-runtests 
			perlbench-report
		  )
		],

	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker' => '6.64',
		},

	'BUILD_REQUIRES' => {
		},

	'TEST_REQUIRES' => {
		'Test::More' => '0.94',
		},

	'PREREQ_PM'    => {
		'Time::HiRes'    => '0',
		'Getopt::Std'    => '0',
		'Sys::Hostname'  => '0',
		'File::Basename' => '0',
		'File::Path'     => '0',
		'Cwd'            => '0',
		},

	'META_MERGE' => {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => "$github.git",
				web  => $github,
				},
			bugtraker => {
				web    => "$github/issues",
				},
			homepage => $github,
			},
		no_index => {
			dir       => [ qw(benchmarks perlbench-results t) ],
			directory => [ qw(benchmarks perlbench-results t) ],
			'package' => 'Pod::HTML',
			}
		},
	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
