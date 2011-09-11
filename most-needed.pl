#!/bin/perl

# determine which patterns have the most hosts (excluding duplicates),
# and thus are most in need of having code -> city mappings

# also creates sorted list of reversed hosts, much easier than looking
# at normally-sorted host list

require "tracelib.pl";

open(A,"hosts/hostnames.txt");
# for this type of count, lower casing is fine
while (<A>) {chomp($_); push(@hosts, lc($_));}
close(A);

# for a host like 24-196-82-252.dhcp.mdsn.wi.charter.com, we give a hit to:
# com
# charter.com
# wi.charter.com
# mdsn.wi.charter.com
# dhcp.mdsn.wi.charter.com
# 24-196-82-252.dhcp.mdsn.wi.charter.com
# In other words, to each subdomain


open(B,">/tmp/most-needed.txt");
open(C,">hosts/reversehosts.txt");

for $i (@hosts) {
  @parts = split(/\./, $i);

# below for debugging
#  print B "FULL: $i\n";

  # build up each piece
  $part = "";
  for $j (reverse @parts) {
    $part="$part.$j";
    print B "$part\n";
  }

  print C join(".", reverse @parts)."\n";

}

close(B); close(C);

# Could do sort in Perl, but easier in Unix
system("sort /tmp/most-needed.txt | uniq -c | sort -nr > hosts/mostneeded.txt");
system("sort -o hosts/reversehosts.txt hosts/reversehosts.txt");

