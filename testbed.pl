#!/bin/perl

require "tracelib.pl";

print traceroute("http://glass.cprm.net/cgi-bin/traceroute.cgi?%IP%", "www.is")."\n";

print traceroute("http://lg.telmexchile.cl/trace.php?host=%IP%&submit=Traceroute!", "cambridge.ac.uk")."\n";
