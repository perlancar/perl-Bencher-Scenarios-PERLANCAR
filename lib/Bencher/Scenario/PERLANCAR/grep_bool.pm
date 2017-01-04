package Bencher::Scenario::PERLANCAR::grep_bool;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark grep() in a bool context',
    description => <<'_',

Finding a nice solution for a shortcutting grep like first.

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
            description => <<'_',

Not a very good idiom. It kind of abuses die(), and has to suffer the overhead
of eval(). Most important of all, it's less clear.

_
        },
        {
            name=>'foreach+last+do',
            code_template=>'state $haystack = <haystack>; if (do { my $found; $_ == <needle> and $found = 1 and last for @$haystack; $found }) { 1 } else { 0 }',
            description => <<'_',

This is a nicer idiom, courtesy of tybalt89 in http://perlmonks.org/?node_id=1178871.

_
        },
        {
            name=>'sub+foreach+return',
            code_template=>'state $haystack = <haystack>; if (sub { $_ == <needle> and return 1 for @$haystack; 0 }->()) { 1 } else { 0 }',
        },
        {
            module => 'List::Util',
            function=>'first',
            code_template=>'state $haystack = <haystack>; if (List::Util::first(sub {$_ == <needle>}, @$haystack)) { 1 } else { 0 }',
        },
        {
            module => 'List::MoreUtils',
            function=>'firstval',
            code_template=>'state $haystack = <haystack>; if (List::MoreUtils::firstval(sub {$_ == <needle>}, @$haystack)) { 1 } else { 0 }',
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

=head1 BENCHMARK NOTES

I'll settle with foreach+last+do for larger lists, and plain grep in other
cases.
