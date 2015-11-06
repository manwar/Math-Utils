#!perl -T
use 5.010001;
use strict;
use warnings;
use Test::More tests => 12;

use Math::Utils qw(:utility);

my $idx;
my $coordstr;
my @coords;

my $d = [3, 5];
my $dstr = "[" . join(", ", @$d) . "]";
my $offset = [1, 1];

#
# Row major test 1.
#
$idx = rmajor_index($d, [1, 4]);
ok($idx == 9, "rmajor_index($dstr, [1, 4]) returned $idx");

@coords = @{ index_rmajor($d, 9) };
$coordstr = join(", ", @coords);
ok($coordstr eq "1, 4", "index_rmajor($dstr, 9) returned $coordstr");

#
# Row major test 2.
#
$idx = rmajor_index($d, [1, 4], $offset);
ok($idx == 3, "rmajor_index($dstr, [1, 4], $offset) returned $idx");

@coords = @{ index_rmajor($d, 3, $offset) };
$coordstr = join(", ", @coords);
ok($coordstr eq "1, 4", "index_rmajor($dstr, 3, $offset) returned $coordstr");

#
# Column major test 1.
#
$idx = cmajor_index($d, [1, 4]);
ok($idx == 13, "cmajor_index($dstr, [1, 4]) returned $idx");

@coords = @{ index_cmajor($d, 13) };
$coordstr = join(", ", @coords);
ok($coordstr eq "1, 4", "index_cmajor($dstr, 13) returned $coordstr");

#
# Column major test 2.
#
$idx = cmajor_index($d, [1, 4], $offset);
ok($idx == 9, "cmajor_index($dstr, [1, 4], $offset) returned $idx");

@coords = @{ index_cmajor($d, 9, $offset) };
$coordstr = join(", ", @coords);
ok($coordstr eq "1, 4", "index_cmajor($dstr, 9, $offset) returned $coordstr");

#
# Row major test 3.
#
$idx = rmajor_index($d, [2, 4]);
ok($idx == 14, "rmajor_index($dstr, [2, 4]) returned $idx");

@coords = @{ index_rmajor($d, 14) };
$coordstr = join(", ", @coords);
ok($coordstr eq "2, 4", "index_rmajor($dstr, 14) returned $coordstr");

#
# Row major test 4.
#
$idx = rmajor_index($d, [3, 5], $offset);
ok($idx == 14, "rmajor_index($dstr, [3, 5], $offset) returned $idx");

@coords = @{ index_rmajor($d, 14, $offset) };
$coordstr = join(", ", @coords);
ok($coordstr eq "3, 5", "index_rmajor($dstr, 14, $offset) returned $coordstr");

