package Bencher::Scenario::PERLANCAR::In;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

@main::ary_100  = (1..100);
@main::ary_10k  = (1..10_000);
@main::ary_1mil = (1..1000_000);

eval "package main; use List::Util 'first'"; die if $@;

our $scenario = {
    summary => 'Benchmark the task of checking whether an item is in an array',
    participants => [
        {
            name => 'grep',
            code_template => 'grep { $_ <op:raw> <needle> } @main::<haystack:raw>',
        },
        {
            name => 'first',
            code_template => 'first { $_ <op:raw> <needle> } @main::<haystack:raw>',
        },
        {
            name => 'first (array)',
            fcall_template => 'Array::AllUtils::first(sub { $_ <op:raw> <needle> }, \\@main::<haystack:raw>)',
        },
        {
            name => 'smartmatch',
            code_template => 'use experimental "smartmatch"; <needle> ~~ @main::<haystack:raw>',
        },
    ],
    datasets => [
        {name => '100 items' , args => {'haystack'=>'ary_100' , op => '==', 'needle@' => [1, 50, 100]}},
        {name => '10k' , args => {'haystack'=>'ary_10k' , op => '==', 'needle@' => [1, 5000, 10_000]}},
        {name => '1mil', args => {'haystack'=>'ary_1mil', op => '==', 'needle@' => [1, 500_000, 1000_000]}},
    ],
};

1;
# ABSTRACT:
