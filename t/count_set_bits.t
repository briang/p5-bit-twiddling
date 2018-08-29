#!/usr/bin/env perl

#:TAGS:

use 5.022;

use strict;  use warnings;  use autodie qw/:all/;

use Data::Dump;

if (0) {
    no strict 'refs';
    diag($_), $_->() for grep { /^test_/ } keys %::
}
################################################################################
use Test::Most qw(no_plan);

use Bit::Twiddling ':all';

# use File::Spec; Test::Most->builder->output(File::Spec->devnull);

for ( [0, 0], [1, 1], [2, 1], [3, 2], [2**55 - 1, 55] ) {
    my ($input, $output) = @$_;
    is count_set_bits($input), $output, "count_set_bits($input) = $output";
}

done_testing;
