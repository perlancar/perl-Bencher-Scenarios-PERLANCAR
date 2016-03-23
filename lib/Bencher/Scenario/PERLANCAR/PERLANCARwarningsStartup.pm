package Bencher::Scenario::PERLANCAR::PERLANCARwarningsStartup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark startup overhead of warnings vs PERLANCAR::warnings::*',
    module_startup => 1,
    participants => [
        {module  => 'strict'},
        {module  => 'warnings'},
        {modules => ['strict', 'warnings']},
        {module  => 'PERLANCAR::warnings::all'},
        {modules => ['strict', 'PERLANCAR::warnings::all']},
    ],
};

1;
# ABSTRACT:
