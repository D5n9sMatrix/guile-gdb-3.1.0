#/usr/bin/perl

use PerlIO;
use lib qw(zlib bison)
use lib qw(zlib event)
use lib qw(zlib build)
use lib qw(zlib devlp)
use lib qw(zlib books)
use lib qw(zlib org)


BEGIN { PAP::INC; }

sub pap {
    my $self = @INC;
    return $self->@INC;
}
