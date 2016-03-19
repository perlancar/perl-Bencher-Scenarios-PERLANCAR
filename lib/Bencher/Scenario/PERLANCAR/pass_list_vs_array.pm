package Bencher::Scenario::PERLANCAR::pass_list_vs_array;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark passing list vs array reference',
    description => <<'_',


_
    participants => [
        {
            name=>'pass_list',
            code_template=>'my $sub = sub {}; my @list = 1..<size>;  for (1..<reuse>) { $sub->(@list) }',
        },
        {
            name=>'pass_arrayref',
            code_template=>'my $sub = sub {}; my @list = 1..<size>;  for (1..<reuse>) { $sub->(\@list) }',
        },
    ],

    datasets => [
        {name => 'data', args => {'size@'=>[100, 1000, 10000], 'reuse@'=>[1, 10, 100, 1000]}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

Passing a large array by reference will generate a large saving only if we reuse
the list (pass it multiple times).
