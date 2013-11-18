package BackWrite::Model::Website;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'website',
    columns        => [qw/id title author description base_url maintenance updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;




