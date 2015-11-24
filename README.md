Although I am no longer actively supporting the Sarangworld Traceroute
Project, this git repo provides information that may be useful to
others interested in geolocation. The files in this directory (see
also the README.md in hosts/):

  - most-needed.pl: Perl script that counts the TLDs, 2nd level
  domains, 3rd level domains, etc of all hosts in hosts/hostnames.txt,
  to see which "domains" appear most frequently in my records.

  - hosts/mostneeded.txt: The output of most-needed.pl above.

  - hosts/reversehosts.txt: Another output of most-needed.pl that just
  list hostnames (in alphabetical order) without counts.

You can probably safely ignore everything below this line.

  - tracelib.pl: The start of a Perl library for the "new" traceroute
  project (that never materialized). Contains only one function and
  can probably be safely ignored.

  - testbed.pl: A testbed for tracelib.pl that can probably be safely
  ignored.

  - ipranges.txt: designed to hold IP ranges for "new" traceroute
  project (that never materialized) that are in a known fixed
  location; currently only one entry, and can probably be safely
  ignored.

  - codes.txt: designed to hold city to code conversions for "new"
  traceroute project (that never materialized). There are only a few
  entries here, and they can probably be safely ignored.

  - patterns.txt: designed to hold patterns (in reverse dotted form)
  for "new" traceroute project (that never materialized). There are
  only three entries here, and they can probably be safely ignored.

  - parse-existing-hosts.pl: a Perl script that was going to parse
  hostnames for the "new" traceroute project (that never
  materialized).

