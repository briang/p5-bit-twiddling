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

use XS::Wrap ':all';

# use File::Spec; Test::Most->builder->output(File::Spec->devnull);

for ( [0, 1], [1, 1], [2, 2], [3, 4], [2**55 - 1234, 2**55] ) {
    my ($input, $output) = @$_;
    is nearest_higher_power_of_2($input), $output, "nhpo2($input) = $output";
}

done_testing;
