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

while (<B>) {
  chomp();

  # reverse hostname
  $reverse = join(".",reverse(split(/\./, $_)));

  # check against all patterns, abort when found
  for $j (@patterns) {
    # TODO: decide if I want this case-sensitive (may be useful, actually)
    if ($reverse=~/$j/) {
      print "MATCH: $_ $j\n";
    }
  }
}




