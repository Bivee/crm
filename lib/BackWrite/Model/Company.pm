package BackWrite::Model::Company;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'company',
    columns        => [qw/id name created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
