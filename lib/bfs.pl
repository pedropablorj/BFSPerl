#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

# Methods needed to traverse a graph using BFS
# Graph input in the for G(V,E) ex. ((1, 2), (2, 3));
#

sub initialize {
	my $graph = shift;

	for (@$graph) {
		my @point = @{$_};
		print "$point[0]\n";	
	}
}

#Test
my @p1 = (1,2);
my @p2 = (2,3);
my @G = (\@p1,\@p2);

initialize(\@G);

