package Bencher::Scenario::PERLANCAR::convert_package_to_path;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark codes that convert Foo::Bar -> Foo/Bar.pm',
    description => <<'_',

This is a task usually performed when one has a package name (e.g.
`Foo::Bar::Baz`) in a variable and wants to load it using `require()`, which
accepts module to be loaded in the form of `Foo/Bar/Baz.pm`.

_
    participants => [
        {
            name=>'code1',
            code_template=>'my $pkg = <package>; $pkg =~ s!::!/!g; "$pkg.pm"',
        },
        {
            name=>'code2', # seen in new.pm. which is nice because it doesn't actually require a temporary variable
            code_template=>'join("/", split "::", <package>).".pm"',
        },
        {
            name=>'code2b',
            code_template=>'my $pkg = <package>; join("/", split "::", $pkg).".pm"',
        },
    ],

    datasets => [
        {name=>'ds1', args=>{package=>'Foo::Bar::Baz::Qux'}},
    ],
};

1;
# ABSTRACT:
