package Bencher::Scenario::PERLANCAR::expr_grep_vs_block_grep;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark expr grep vs block grep',
    participants => [
        {
            name=>'expr',
            code_template=>'state $ary = [1..<size>]; [grep $_ % 2 == 0, @$ary]',
        },
        {
            name=>'block',
            code_template=>'state $ary = [1..<size>]; [grep { $_ % 2 == 0 } @$ary]',
        },
    ],
    datasets => [
        {args=>{size=>10}},
        {args=>{size=>100}},
        {args=>{size=>1000}},
        {args=>{size=>10000}},
        {args=>{size=>100000}},
        {args=>{size=>1000000}},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

Up to size=100k, there's no clear winner so we can say that they both roughly
have the same speed.
