#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# General Public License or the Perl Artistic License.

top_filename("t/t_delay.v");

compile (
	 fails=>1,
	 expect=>
'%Warning-STMTDLY: t/t_delay.v:\d+: Ignoring delay on this delayed statement.
.*%Error: Exiting due to.*',
	 ) if $Self->{v3};

ok(1);
1;
