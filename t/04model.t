use Test::More;

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $package = 'BackWrite::Model';

# use test
use_ok($package);

# methods test
can_ok($package, $_) for qw/load exists/;

# model load test
ok(!$package->load('Foo::Bar'), 'class not load ok');
ok($package->load('User'), 'class load ok');

# model exists test
ok(!$package->exists('Foo'), 'not exists model ok');
ok($package->exists('User'), 'exists model ok');

done_testing();
