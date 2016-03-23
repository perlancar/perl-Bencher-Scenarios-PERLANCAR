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
        {module=>'warnings'},
        {module=>'PERLANCAR::warnings::all'},
        #{module=>'PERLANCAR::warnings::default'},
    ],
};

1;
# ABSTRACT:
