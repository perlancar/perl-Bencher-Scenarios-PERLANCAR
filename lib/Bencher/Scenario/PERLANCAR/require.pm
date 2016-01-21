package Bencher::Scenario::PERLANCAR::require;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark require() in a tight loop/subroutine',
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
            name=>'require_in_state',
            code_template=>'state $dummy = do { require File::Find }',
        },
    ],
};

1;
# ABSTRACT:
