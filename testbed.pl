#!/bin/perl

require "tracelib.pl";

print traceroute("http://glass.cprm.net/cgi-bin/traceroute.cgi?%IP%", "www.is")."\n";

print traceroute("http://lg.telmexchile.cl/trace.php?host=%IP%&submit=Traceroute!", "cambridge.ac.uk")."\n";

# print traceroute("http://202.71.136.244/cgi-bin/trace/trace.pl?target=%IP%&id=1", "67.215.65.132")."\n";

print traceroute("http://network.fasthit.net/cgi-bin/trace?%IP%", "www.cambridge.ac.uk")."\n";

print traceroute("http://network.fasthit.net/cgi-bin/trace?%IP%", "ariel.unm.edu")."\n";

print traceroute("http://network.fasthit.net/cgi-bin/trace?%IP%", "tulane.edu")."\n";

print traceroute("http://network.fasthit.net/cgi-bin/trace?%IP%", "www.nmsu.edu")."\n";
