# Translate English to Slobovian
# Kudos to gein@knivby.nu for 8-ball.pl

use strict;
use vars qw($VERSION %IRSSI);
use Irssi qw(signal_add);

$VERSION = '0.01';
%IRSSI = (
	authors		=> 'jesse',
	contact		=> 'none',
	name		=> 'Slobovian',
	description	=> 'Translate English to Slobovian',
	license		=> 'GPL',
);

sub translate {
    my ($server, $msg, $nick, $address, $target) = @_;
    unless ($mgs =~ /^slob:(.*)/) { return 0; }
    my $text = $1;
    $text =~ tr/lrfvpbdtszgk/rlvfbptdzskg/;
    $text =~ tr/LRFVPBDTSZGK/RLVFBPTDZSKG/;
    $server->command('msg '.$target.' '.$nick.$text);
}

sub own {
    my ($server, $msg, $target) = @_;
    translate($server, $msg, "", $target);
}

sub public {
    my ($server, $msg, $nick, $address, $target) = @_;
    translate($server, $msg, $nick.": ", $target);
}

signal_add("message public", "public");
signal_add("message own", "own");
