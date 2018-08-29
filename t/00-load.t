#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'XS::Wrap' ) || print "Bail out!\n";
}

diag( "Testing XS::Wrap $XS::Wrap::VERSION, Perl $], $^X" );
