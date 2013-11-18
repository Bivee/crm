package BackWrite::Model::Activity;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'activity',
    columns        => [qw/id user action type created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
