package Bencher::Scenario::PERLANCAR::pkg_to_pkgpm;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark some ways to convert Foo::Bar::Baz to Foo/Bar/Baz.pm',
    participants => [
        {
            name=>'method1',
            code_template=>'state $pkg = "Foo::Bar::Baz"; my $pkg_pm = $pkg; $pkg_pm =~ s!::!/!g; $pkg_pm .= ".pm"; $pkg_pm',
        },
        {
            name=>'method2',
            code_template=>'state $pkg = "Foo::Bar::Baz"; (my $pkg_pm = "$pkg.pm") =~ s!::!/!g; $pkg_pm',
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

Practically indistinguishable performance-wise, so just pick the
shortest/clearest according to you.
