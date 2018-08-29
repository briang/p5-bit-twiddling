package XS::Wrap;

use strict;
use warnings;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('XS::Wrap', $VERSION);

use Exporter 'import';

our @EXPORT_OK = qw(
    count_set_bits
    nearest_higher_power_of_2
);

our %EXPORT_TAGS = ( all => [@EXPORT_OK] );

1;
