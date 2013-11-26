use Test::More;

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $package = 'BackWrite::I18N';

# use test
use_ok($package);

# methods test
can_ok($package, $_) for qw/load list_langs exists/;

# lang load test
ok(!$package->load('Foo::Bar'), 'class not load ok');
ok($package->load('en'), 'class load ok');

# lang exists test
ok(!$package->exists('foo'), 'not exists lang ok');
ok($package->exists('en'), 'exists lang ok');

# lang list test
my $list = $package->list_langs;
ok(ref $list eq 'ARRAY', ref $list);
is(int(@$list), 3); # default supported lang number

done_testing();
