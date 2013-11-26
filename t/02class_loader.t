use Test::More;

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

my $package = 'BackWrite::App::Class::Loader';

# use test
use_ok($package);

# methods test
can_ok($package, $_) for qw/load exists/;

# class load test
my $obj = $package->load('BackWrite::Controller::Home');
ok(!$package->load('Foo::Bar'), 'class not load ok');
ok($obj, 'class load ok');
ok($obj->isa('BackWrite::Controller::Base'), 'class isa ok');

# class exists test
ok(!$package->exists('Foo::Bar'), 'not exists ok');
ok($package->exists('BackWrite'), 'exists ok');

done_testing();
