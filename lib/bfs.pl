#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

#Defining globals 
#
my %parent;
my %processed;
my %discovered;

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


# Method to initialize the search
# Input adjacent list as a hash
# Output a list with [parent,processed,discovered] 

sub initialize {
	for (keys %{$_[0]}) {
		$parent{$_} = -1;
		$processed{$_} = 0;
		$discovered{$_} = 0;
	}
}

# Main method to execute BFS
#
#

sub bfs {

}

# Methos to expliting traversal
#
#

#Flows' Test
my @p1 = (1,2);
my @p2 = (2,3);
my @G = (\@p1,\@p2);

my $a_list = create_list(\@G);

my @values = initialize($a_list);

print Dumper([\%discovered,\%processed,\%parent]);
