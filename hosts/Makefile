# many files here are generated
all: mostneeded.txt reversehosts.txt current-codematches.txt
mostneeded.txt: hostnames.txt
	../most-needed.pl
reversehosts.txt: hostnames.txt
	../most-needed.pl
current-codematches.txt: hostnames.txt ../patterns.txt
	../parse-existing-hosts.pl
