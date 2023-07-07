#!/usr/bin/env perl
use v5.36;
use strict;
use DateTime;

my $ip_out = `ip -4 addr show`;
die 'not actual b7j0c.org; not running' unless ($ip_out =~ /inet 149.28.248.5/);

my $dt = DateTime->now();
$dt->set_time_zone('America/Chicago');
my $prefix = 'b7j0c_';
my $prefix_yyyymmdd = $prefix . $dt->ymd('');
my $prefix_reserve_yyyymmdd = $prefix . $dt->subtract('days'=>1)->ymd('');
say "today:\t\t" . $prefix_yyyymmdd;
say "yesterday:\t" . $prefix_reserve_yyyymmdd;
my $tarsnap = 'tarsnap --cachedir /root/tarsnap-cache --keyfile /root/tarsnap.key';
my $list_archives = `$tarsnap --list-archives`;
my $backup_paths = '/home /usr/local/www';
my $excludes = '';
chomp($list_archives);
my @archives = split(/\n/,$list_archives);
my $make_yyyymmdd = 1;
my @delete_these = ();
for my $archive (@archives) {
    say "list:\t\t" . $archive;
    if ($archive eq $prefix_yyyymmdd) {
        $make_yyyymmdd = 0;
    }
}
my $tarsnap_cmd = '';
if (1 == $make_yyyymmdd) {
    say "make for today";
    my $yyyymmdd_cmd = $tarsnap . ' -c -f ' . $prefix_yyyymmdd . ' ' . $backup_paths . ' ' . $excludes;
    say $yyyymmdd_cmd;
    $tarsnap_cmd = $yyyymmdd_cmd . ';';
}
say $tarsnap_cmd;
system($tarsnap_cmd) if ($tarsnap_cmd ne '');

1;
