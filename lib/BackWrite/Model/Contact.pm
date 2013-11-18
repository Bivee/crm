package BackWrite::Model::Contact;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'contact',
    columns        => [qw/id name description job company street city state zip type email website phone mobile active author updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
);

1;
