package Bencher::Scenario::PERLANCAR::CommonModulesStartup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark startup overhead of commonly used modules',
    module_startup => 1,
    participants => [
        {module=>'strict'},
        {module=>'warnings'},
        {modules=>['strict', 'warnings']},
        {module=>'utf8'},
        {module=>'Role::Tiny'},
        {module=>'Role::Tiny::With'},
        {modules=>['Role::Tiny', 'Role::Tiny::With']},
        {module=>'List::Util'},
    ],
};

1;
# ABSTRACT:
