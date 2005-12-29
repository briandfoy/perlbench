package PerlBench::Results;

use strict;
use File::Find ();

sub new {
    my $class = shift;
    my $resdir = shift || "perlbench-results";
    return undef unless -d $resdir;
    my $self = bless {}, $class;
    $self->_scan($resdir);
    return $self;
}

sub _scan {
    my($self, $dir) = @_;
    $self->{dir} = $dir;

    # locate result files
    my @res;
    File::Find::find(sub {
       if (/\.pb$/) {
	   my $f = $File::Find::name;
	   $f = substr($f, length($dir) + 1);
	   $f =~ s,\\,/,g if $^O eq "MSWin32";
           push(@res, $f);
       }
    }, $dir);

    # read results
    for my $f (@res) {
	#print "$f\n";
	my($hostname, $perls, $perl, $tests, $test) = split("/", $f, 5);
	die unless $perls eq "perls";
	die unless $tests eq "tests";
	$test =~ s,/[^/]*$,,;
	my $res = _read_pb_file("$dir/$f");
	push(@{$self->{h}{$hostname}{p}{$perl}{t}{$test}}, $res);
    }

    # fill in additional information about hosts and perls
    while(my($hostname, $hosthash) = each %{$self->{h} || {}}) {
	#print "host $hostname\n";
	while (my($perl, $perlhash) = each %{$hosthash->{p}}) {
	    #print " perl $perl\n";
	    my $perldir = "$dir/$hostname/perls/$perl";
	    my $version_txt = "$perldir/version.txt";
	    open(my $fh, "<", $version_txt) || die "Can't open $version_txt: $!";
	    local($_);
	    while (<$fh>) {
		if (/^This is perl, v(\S+)/) {
		    $perlhash->{version} = $1;
		    $perlhash->{name} = "perl-$1";
		}
		if (/^Binary build (\d+.*) provided by ActiveState/) {
		    $perlhash->{name} .= " build $1";
		    $perlhash->{name} =~ s/^perl/ActivePerl/;
		}
	    }
	    die "Can't determine perl version from $version_txt" unless $perlhash->{version};
	    $perlhash->{dir} = $perldir;
	}
    }
}

sub _read_pb_file {
    my $file = shift;
    open(my $fh, "<", $file) || die "Can't open '$file': $!";
    my %hash;
    local($_);
    while (<$fh>) {
	if (/^(\w[\w-]*)\s*:\s*(.*)/) {
	    my($k, $v) = ($1, $2);
	    $k = lc($k);
	    $k =~ s/-/_/g;
	    $hash{$k} = $v;
	}
	else {
	    warn "$file: $_";
	}
    }
    close($fh);
    #$hash{file} = $file;
    return \%hash;
}

1;
