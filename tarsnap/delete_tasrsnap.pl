#!/usr/bin/env perl
use v5.32;
use strict;
use DateTime;

my $ip_out = `ip -4 addr show`;
die 'not actual b7j0c.org; not running' unless ($ip_out =~ /inet 144.202.72.212/);

my $dt = DateTime->now();
$dt->set_time_zone('America/Chicago');
my $prefix = 'b7j0cdebian_';
my $prefix_yyyymmdd = $prefix . $dt->ymd('');
my $prefix_reserve_yyyymmdd = $prefix . $dt->subtract('days'=>1)->ymd('');
say "today:\t\t" . $prefix_yyyymmdd;
say "yesterday:\t" . $prefix_reserve_yyyymmdd;
my $tarsnap = 'tarsnap --cachedir /root/tarsnap-cache --keyfile /root/tarsnap.key';
my $list_archives = `$tarsnap --list-archives`;
chomp($list_archives);
my @archives = split(/\n/,$list_archives);
my $make_yyyymmdd = 1;
my @delete_these = ();
for my $archive (@archives) {
    say "list:\t\t" . $archive;
    if ($archive eq $prefix_yyyymmdd) {
        $make_yyyymmdd = 0;
    } else {
        if ($archive ne $prefix_reserve_yyyymmdd) {
            push(@delete_these,$archive);
        }
    }
}
my $tarsnap_cmd = '';
for my $delete_this (@delete_these) {
    say "delete $delete_this";
    my $delete_cmd = $tarsnap . ' -d -f ' . $delete_this;
    $tarsnap_cmd .= $delete_cmd . ';';
}
say $tarsnap_cmd;
system($tarsnap_cmd) if ($tarsnap_cmd ne '');

1;
