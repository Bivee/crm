package BackWrite::Model::Task;
use Mojo::Base 'BackWrite::Model::Base';

__PACKAGE__->schema(
    table          => 'task',
    columns        => [qw/id title description date project tags assigned author finished updated created/],
    primary_keys   => ['id'],
    auto_increment => 'id',
    #relationships => {
    #    project => {
    #        type  => 'one to one',
    #        class => 'BackWrite::Model::Project',
    #        map   => {project => 'id'}
    #    },
    #    author => {
    #        type  => 'one to one',
    #        class => 'BackWrite::Model::User',
    #        map   => {author => 'id'}
    #    },
    #    assigned => {
    #        type  => 'one to one',
    #        class => 'BackWrite::Model::User',
    #        map   => {assigned => 'id'}
    #    }
    #}
);

1;
