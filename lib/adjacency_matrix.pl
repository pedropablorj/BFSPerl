#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

# This script create a adjacency matrix to use it with a graph problem
# Graph input in the for G(V,E) ex. ((1, 2), (2, 3));
# User 1 to directed graphs and 0 for undirected
#

sub create_matrix {
	my $graph = shift;
	my $directed =  shift;
	my @matrix;

	for (@$graph) {
		my @point = @{$_};
		$matrix[$point[0]] = () unless (exists $matrix[$point[0]]);
		$matrix[$point[0]][$point[1]] = 1;

		#If the graph is undirected
		unless ($directed) {
			$matrix[$point[1]] = () unless (exists $matrix[$point[1]]);
			$matrix[$point[1]][$point[0]] = 1;
		}
	}

	\@matrix;
}

my @p1 = (1,2);
my @p2 = (2,3);
my @G = (\@p1,\@p2);
my $a_matrix = create_matrix(\@G, 0);

print Dumper($a_matrix);

