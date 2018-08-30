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

for ( [0, 1], [1, 1], [2, 2], [3, 4], [2**55 - 1234, 2**55] ) {
    my ($input, $output) = @$_;
    is nearest_higher_power_of_2($input), $output, "nhpo2($input) returns $output";
}

# numeric
is nearest_higher_power_of_2(""), 1, 'nhpo2("") returns 1';

is nearest_higher_power_of_2("12"), 16, 'nhpo2("12") returns 16';

# numeric
is nearest_higher_power_of_2("x"), 1, 'nhpo2("x") returns 1';

# uninitialized
is nearest_higher_power_of_2(undef), 1, 'nhpo2("x") returns 1';
# next_power_of_2_ge_to

is nearest_higher_power_of_2(-111), 0, 'nhpo2(-111) returns 0';



done_testing;
