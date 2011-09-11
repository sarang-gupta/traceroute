# many files here are generated
# TODO: remove silly "cd .." somehow
all: mostneeded.txt reversehosts.txt current-codematches.txt
mostneeded.txt: hostnames.txt
	cd ..; ./most-needed.pl
reversehosts.txt: hostnames.txt
	cd ..; ./most-needed.pl
current-codematches.txt: hostnames.txt ../patterns.txt
	cd ..; ./parse-existing-hosts.pl
