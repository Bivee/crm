package BackWrite::Model::Champaign;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'champaign',
    columns        => [qw/id name description status start finish finished type cost updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
