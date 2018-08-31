#!/usr/bin/env perl

#:TAGS:

use 5.022;

use strict;  use warnings;

BEGIN { # XXX
    if ($ENV{EMACS}) {
        chdir '..' until -d 't';
        use lib qw(blib/lib blib/arch)
    }
}

use Data::Dump; # XXX

if (0) { # XXX
    no strict 'refs';
    diag($_), $_->() for grep { /^test_/ } keys %::
}
################################################################################
use Test::More;
use Test::Warn;

use Bit::Twiddling ':all';

# use File::Spec; Test::Most->builder->output(File::Spec->devnull);

for ( [0, 1], [1, 1], [2, 2], [3, 4], [2**55 - 1234, 2**55] ) {
    my ($input, $output) = @$_;
    is nearest_higher_power_of_2($input), $output, "nhpo2($input) returns $output";
}

is nearest_higher_power_of_2("12"), 16, 'nhpo2("12") returns 16';

warning_like {
    is nearest_higher_power_of_2(""), 1, 'nhpo2("") returns 1'
} qr/Argument "" isn't numeric in subroutine entry/,
  'nhpo2("") gives a warning';

warning_like {
    is nearest_higher_power_of_2("x"), 1, 'nhpo2("x") returns 1';
} qr/Argument "x" isn't numeric in subroutine entry/,
  'nhpo2("x") gives a warning';

warning_like {
    is nearest_higher_power_of_2(undef), 1, 'nhpo2(undef) returns 1';
} qr/Use of uninitialized value in subroutine entry/,
  'nhpo2(undef) gives a warning';
# next_power_of_2_ge_to

is nearest_higher_power_of_2(-111), 0, 'nhpo2(-111) returns 0';

done_testing;
