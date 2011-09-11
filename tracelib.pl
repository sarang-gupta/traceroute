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
  my($dflag);

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

  my($cmd) = "curl -o $tmpfile '$url' $post_data";
  print "COMMAND: $cmd\n";
  # TODO: error checking
  system($cmd);
  return $tmpfile;
}

1;

