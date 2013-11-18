package BackWrite::Model::Note;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'note',
    columns        => [qw/id title content tags author updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
