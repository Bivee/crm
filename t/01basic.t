use Mojo::Base -strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Data::Dumper;
use BackWrite::Model;


my $model = BackWrite::Model->load('Contact');
$model->init;

print Dumper $model->columns;

