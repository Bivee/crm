package BackWrite::Model::Project;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'project',
    columns        => [qw/id name description status start finish finished cost updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
