#!/bin/perl

# parses the hosts we've already seen

# read patterns
open(A,"patterns.txt");

while (<A>){
  chomp(); 
  # ignore comments and the empty pattern (extra newline in patterns.txt)
  if (/^\#/|/^\s*$/) {next;}
  push(@patterns,$_);
}

close(A);

# and now hosts

open(B,"hosts/hostnames.txt");
open(C,">hosts/current-codematches.txt");

while (<B>) {
  chomp();

  # reverse hostname
  $reverse = join(".",reverse(split(/\./, $_)));

  # check against all patterns, abort when found
  for $j (@patterns) {
    # TODO: decide if I want this case-sensitive (may be useful, actually)
    if (@capture = ($reverse=~m/$j/)) {
      # join @capture with dots as code (code first for sorting)
      print C join(".",@capture)."\t$_\n";
      last;
    }
  }
}

close(C);
system("sort -o hosts/current-codematches.txt hosts/current-codematches.txt");




