package Bencher::Scenario::PERLANCAR::grep_bool;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark grep() in a bool context',
    description => <<'_',

This is to check if `grep()` can shortcut in a bool context.

_
    participants => [
        {
            name=>'grep',
            code_template=>'state $haystack = <haystack>; if (grep {$_ == <needle>} @$haystack) { 1 } else { 0 }',
        },
        {
            name=>'grep+die',
            summary => 'use grep + die to simulate shortcutting',
            code_template=>'state $haystack = <haystack>; if (eval { grep {$_ == <needle> && die} @$haystack }, $@) { 1 } else { 0 }',
        },
        {
            module => 'List::Util',
            function=>'first',
            code_template=>'state $haystack = <haystack>; if (List::Util::first(sub {$_ == <needle>}, @$haystack)) { 1 } else { 0 }',
        },
        {
            module => 'Array::AllUtils',
            function=>'first',
            code_template=>'state $haystack = <haystack>; if (Array::AllUtils::first(sub {$_ == <needle>}, $haystack)) { 1 } else { 0 }',
        },
    ],

    datasets => [
        {name=>  'first'   , include_by_default=>1, args=>{haystack => [1..  10000], needle =>      1}},
        {name=>  'last'    , include_by_default=>1, args=>{haystack => [1..  10000], needle =>  10000}},
        {name=>  'notfound', include_by_default=>1, args=>{haystack => [1..  10000], needle =>  10001}},
    ],
};

1;
# ABSTRACT:
