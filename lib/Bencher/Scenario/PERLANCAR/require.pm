package Bencher::Scenario::PERLANCAR::require;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark require() in a tight loop/subroutine',
    description => <<'_',

`require()` can be put inside a block (like a subroutine) to delay loading a
module:

    sub foo {
        require Some::Module;
        ...
    }

After a module is loaded, the next `require()` should be cheap enough: it just
checks against `%INC` to see if an entry for the module is there. So it should
just be the cost of a single hash lookup.

However, for very tight loops/subroutines, you can avoid (reduce) this cost by
putting the `require()` inside a state variable, which will cause the
`require()` to be evaluated just once:

    sub foo {
        state $dummy = do { require Some::Module };
        ...
    }

There is a per-sub-invocation cost too of setting up the state variable
`$dummy`. But this cost is several times smaller.

Or, alternatively, you might also want to decide to put the `require()`
statement outside of the block/subroutine.

_
    participants => [
        {
            name=>'baseline_empty_sub',
            code_template=>' ',
        },
        {
            name=>'require_in_sub',
            code_template=>'require File::Find',
        },
        {
            name=>'require_in_sub_pm',
            code_template=>'require "File/Find.pm"',
            summary => 'There is no effect of using the path form',
        },
        {
            name=>'require_in_state',
            code_template=>'state $dummy = do { require File::Find }',
        },
    ],
};

1;
# ABSTRACT:
