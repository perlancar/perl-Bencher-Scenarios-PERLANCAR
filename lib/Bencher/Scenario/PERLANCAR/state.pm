package Bencher::Scenario::PERLANCAR::state;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark overhead of state (vs my) variables in a tight subroutine',
    description => <<'_',

Each variable declaration is not free.

_
    participants => [
        {
            name=>'baseline_0',
            code_template=>' ',
            #include_by_default => 0,
        },
        {
            name=>'1_state',
            code_template=>'state $s1 = 1',
        },
        {
            name=>'2_state',
            code_template=>'state $s1 = 1; state $s2 = 1',
        },
        {
            name=>'5_state',
            code_template=>'state $s1 = 1; state $s2 = 1; state $s3 = 1; state $s4 = 1; state $s5 = 1; ',
        },
        {
            name=>'10_state',
            code_template=>'state $s1=1; state $s2=1; state $s3=1; state $s4=1; state $s5=1; state $s6=1; state $s7=1; state $s8=1; state $s9=1; state $s10=1; ',
        },

        {
            name=>'5_state_do',
            code_template=>'state $s1 = do{1}; state $s2 = do{1}; state $s3 = do{1}; state $s4 = do{1}; state $s5 = do{1}; ',
            include_by_default => 0,
            summary => "The use of do{} doesn't affect the timing because they are evaluated once",
        },

        {
            name=>'1_my',
            code_template=>'my $s1 = 1',
        },
        {
            name=>'2_my',
            code_template=>'my $s1 = 1; my $s2 = 1',
        },
        {
            name=>'5_my',
            code_template=>'my $s1 = 1; my $s2 = 1; my $s3 = 1; my $s4 = 1; my $s5 = 1; ',
        },
        {
            name=>'10_my',
            code_template=>'my $s1=1; my $s2=1; my $s3=1; my $s4=1; my $s5=1; my $s6=1; my $s7=1; my $s8=1; my $s9=1; my $s10=1; ',
        },
    ],
};

1;
# ABSTRACT:
