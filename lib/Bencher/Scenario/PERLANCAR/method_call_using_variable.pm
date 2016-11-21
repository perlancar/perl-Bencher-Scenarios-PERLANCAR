package Bencher::Scenario::PERLANCAR::method_call_using_variable;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark calling a method with the name of the method in a variable',
    description => <<'_',


_
    participants => [
        {
            name=>'class, literal',
            code_template=>'Foo->meth',
        },
        {
            name=>'class, variable',
            code_template=>'state $meth = "meth"; Foo->$meth',
        },
        {
            name=>'object, literal',
            code_template=>'state $obj = Foo->new; $obj->meth',
        },
        {
            name=>'object, variable',
            code_template=>'state $obj = Foo->new; state $meth = "meth"; $obj->$meth',
        },
    ],
};

package
    Foo;

sub new { my $class = shift; bless {}, $class }

sub meth {}

1;
# ABSTRACT:

=head1 DESCRIPTION

=head1 BENCHMARK NOTES

Using variable as method name is an extra indirection which has a cost.
