#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

# This script create a adjacency list to use it with a graph problem
# Graph input in the for G(V,E) ex. ((1, 2), (2, 3));
# User 1 to directed graphs and 0 for undirected
#

sub create_list {
	my $graph = shift;
	my $directed =  shift;
	my %list;

	for (@$graph) {
		my @point = @{$_};
		$list{$point[0]} = () unless (exists $list{$point[0]});
		push @{$list{$point[0]}}, $point[1];

		#If the graph is undirected
		unless ($directed) {
			$list{$point[1]} = () unless (exists $list{$point[1]});
			push @{$list{$point[1]}}, $point[0];
		}
	}

	\%list;
}

my $a_list = create_list([[1,2],[2,3]], 0);

print Dumper($a_list);

