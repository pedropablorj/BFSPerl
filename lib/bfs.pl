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
# Adjacency list -> Hash
# Start Vertex -> Integer

sub bfs {
	my %graph_list = %{$_[0]};
	my $start = $_[1];
	my @q;
	my $v;
	my $y;
	my @p;
	my $edgenode;

	unshift @q, $start;
	$discovered{$start} = 1;

	while(@q) {
		$v = pop @q;
		$processed{$v} = 1;
		
		process_vertex_early($v);

		return 0 if (!(exists $graph_list{$v}));

		@p = @{$graph_list{$v}};

		for (@p) {
			$y = $_;
			
			do { process_edge($v, $y); } unless ( $processed{$y});
			do { unshift @q, $y; $discovered{$y} = 1; $parent{$y} = $v; } unless ( $discovered{$y} );
		}

		process_vertex_late($v);
	}
}

# Methos to expliting traversal
#
#
sub process_vertex_late {
	print "VL: @_\n";
}

sub process_vertex_early {
	print "VE: @_\n";
}

sub process_edge {
	print "E: @_\n";
}

#Flows' Test
my @p1 = (1,2);
my @p2 = (2,3);
my @G = (\@p1,\@p2);

my $g_list = create_list(\@G);

initialize($g_list);

bfs($g_list, 1);

#print Dumper([\%discovered,\%processed,\%parent]);
