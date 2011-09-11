# Library of useful traceroute functions

use Digest::SHA1;

=item traceroute($url, $target, $post_data="")

Perform a traceroute from the server $url to $target with post data
$post_data and store result in /tmp/trace-$url-$target

If /tmp/trace-$url-$target already exists, just return it.

Returns filename containing result

=cut

sub traceroute {
  my($url, $target, $post_data) = @_;
  my($dflag, $tristar, $result);
  local(*A);
  # TODO: make this local?
  $|=1;

  # Substitute actual IP address
  $url=~s/%IP%/$target/isg;
  $post_data=~s/%IP%/$target/isg;

  # Does file already exist? (hash $url to avoid odd characters)
  my($tmpfile) = "/tmp/trace-".Digest::SHA1::sha1_hex($url)."-$target";
  if (-f $tmpfile) {return $tmpfile;}

  # TODO: maybe open a pipe from curl process and die on "* * *" or
  # similar to speed things up

  # only use -d if needed
  if ($post_data) {$dflag="-d '$post_data'";}

  my($cmd) = "curl -N -s '$url' $post_data";
  print "COMMAND: $cmd\n";
  my($pid) = open(A,"$cmd|");

  while (<A>) {
    # TODO: maybe timeout if next line takes too long to show up
    # If I see "tristar" more than twice, end
    print "GOT: $_\n";
    $result .= $_;
    if (/\*\s+\*\s+\*/ && ++$tristar>=2) {last;}
  }

  # curl doesn't respond to SIGPIPE, so kill it so I can close the fh
  system("kill $pid");
  close(A);

  open(A,">$tmpfile");
  print A $result;
  close(A);

  # TODO: put results in file!
  # TODO: error checking
  return $tmpfile;
}

1;

