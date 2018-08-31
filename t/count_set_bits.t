#!/usr/bin/env perl

#:TAGS:

use 5.022;

use strict;  use warnings;  use autodie qw/:all/;

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

use Bit::Twiddling ':all';

# use File::Spec; Test::Most->builder->output(File::Spec->devnull);

for ( [0, 0], [1, 1], [2, 1], [3, 2], [2**55 - 1, 55] ) {
    my ($input, $output) = @$_;
    is count_set_bits($input), $output, "count_set_bits($input) = $output";
}

is count_set_bits(""), 0, 'count_set_bits("") returns 0';

# WARNs: Argument "12" isn't numeric in subroutine entry
is count_set_bits("12"), 2, 'count_set_bits("12") returns 2';

# WARNs: Argument "x" isn't numeric in subroutine entry
is count_set_bits("x"), 0, 'count_set_bits("somestring") returns 0';

# WARNs: Use of uninitialized value in subroutine entry at t/errors.t line 28.
is count_set_bits(undef), 0, 'count_set_bits(undef) returns 0';

# SHOULD FAIL: if ints aren't 64 bits
is count_set_bits(-1), 64, 'count_set_bits(-1) returns 64';

done_testing;
