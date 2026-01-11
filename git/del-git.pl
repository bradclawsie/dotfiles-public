#!/usr/bin/env perl
use v5.42;

my $branch = $ARGV[0];
$branch =~ s/\s+$//g;
say 'deleting for ' . $branch;
for my $remote (qw( b7j0c github sr.ht codeberg )) {
  my $cmd = "git push $remote :$branch";
  say $cmd;
  system($cmd);
}
__END__
