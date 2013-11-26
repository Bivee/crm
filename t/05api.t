use Test::More;

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $package = 'BackWrite::API';

# use test
use_ok($package);

# methods test
can_ok($package, $_) for qw/load exists/;

# api load test
ok(!$package->load('Foo::Bar'), 'class not load ok');
ok($package->load('User'), 'class load ok');

# api exists test
ok(!$package->exists('Foo'), 'not exists api ok');
ok($package->exists('User'), 'exists api ok');

done_testing();
