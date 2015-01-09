require 5.008;
use strict;
use warnings;

use File::Spec::Functions qw(catfile);

my $module    = 'PerlBench';
my $github    = 'https://github.com/briandfoy/perlbench';
my $main_file = catfile( 'lib', split /::/, "$module.pm" );

my %WriteMakefile = (
	'NAME'          => $module,
	'ABSTRACT_FROM' => $main_file,
	'VERSION_FROM'  => $main_file,
	'EXE_FILES'     => [
		qw(
			perlbench-timeit 
			perlbench-run 
			perlbench-runtests 
			perlbench-report
		  )
		],

	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker'   => '6.64',
		'File::Spec::Functions' => '0',
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
	eval "use $MM_version; 1" or die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
