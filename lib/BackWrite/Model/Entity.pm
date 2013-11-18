package BackWrite::Model::Entity;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'entity',
    columns        => [qw/id name description type active updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
