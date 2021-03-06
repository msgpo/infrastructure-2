#!/usr/bin/env perl
use strict;
use warnings;

use DBI;
use JSON;

my $mode = $ARGV[0];
my $dbname = $ARGV[1];

if (!($mode eq "dbsize" or $mode eq "discover")) {
	print STDERR "mode is not dbsize or discover\n";
	die;
}

if ($mode eq "dbsize" and not defined $dbname) {
	print STDERR "dbsize requires dbname to be defined\n";
	die;
}

my $db = DBI->connect("DBI:Pg:");

if ($mode eq "dbsize") {
	print encode_json($db->selectrow_hashref("SELECT pg_database_size(?) AS dbsize;", undef, $dbname));
} elsif ($mode eq "discover") {
	print encode_json({
		data => $db->selectall_arrayref("SELECT datname \"{#DATNAME}\" FROM pg_database;", {Slice => {}})
	});
} else {
	die "unhandled mode";
}
