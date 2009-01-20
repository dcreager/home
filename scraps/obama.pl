#!/usr/bin/perl

my $remain = 1232470800 - time();
$remain > 0 or print("It's finally over.\n"), exit;

my @dur;
for (60, 60, 24, 100000) {
    unshift @dur, $remain % $_;
    $remain -= $dur[0];
    $remain /= $_;  
}

my @time = qw(day days hour hours minute minutes second seconds);
my @s;
for (0 .. $#dur) {
    my $n = $dur[$_] or next;
    my $unit = $time[$_*2 + ($n != 1)];
    $s[$_] = "$n $unit"; 
}
@s = grep defined, @s;

$s[-1] = "and $s[-1]" if @s > 2;
print join ", ", @s;
print "\n";
