use 5.010;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Bit::Twiddling',
    AUTHOR           => q{Brian Greenfield <briang@cpan.org>},
    VERSION_FROM     => 'lib/Bit/Twiddling.pm',
    ABSTRACT_FROM    => 'lib/Bit/Twiddling.pm',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.010',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Inline::C' => '0'
    },
    TEST_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'XS-Wrap-*' },
);
