#!/usr/bin/env perl
use v5.42;

my $branch = `git branch --show-current`;
$branch =~ s/\s+$//g;
say 'pushing to ' . $branch;
for my $remote (qw( b7j0c github sr.ht codeberg )) {
  my $cmd = "git push $remote $branch";
  say $cmd;
  system($cmd);
}
__END__
