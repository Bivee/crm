package BackWrite::API::Activity;
use Mojo::Base 'BackWrite::API::Base';

use DateTime;
use BackWrite::Model;

# attributes
has 'model' => sub { BackWrite::Model->load('Activity') };
has 'param';

# methods
sub create {
    my ( $self, $param ) = @_;

    # load params
    $self->param($param);

    # load model
    $self->model( BackWrite::Model->load('Activity') )
      unless $self->model;

    # setting columns and store
    $self->model->column( $_, $self->param->{$_} ) for keys %{ $self->param };
    $self->model->create;

    # error
    if ( $self->model && $self->model->error ) {
        $self->error(
            {
                class => 'alert alert-danger',
                text  => 'database error saving entity: ' . $self->model->error,
            }
        );
    }

    $self;
}

sub contact_list {
    my ( $self, $limit ) = @_;

    # get model instance
    $self->model( BackWrite::Model->load('Activity') )
      unless $self->model;

    return $self->model->find(
        where => [ type => 'Contact' ],
        limit => $limit || 10,
        order_by => 'created DESC'
    ) || undef;
}

sub project_list {
    my ( $self, $limit ) = @_;

    # get model instance
    $self->model( BackWrite::Model->load('Activity') )
      unless $self->model;

    return $self->model->find(
        where => [ type => 'Project' ],
        limit => $limit || 10,
        order_by => 'created DESC'
    ) || undef;
}

sub task_list {
    my ( $self, $limit ) = @_;

    # get model instance
    $self->model( BackWrite::Model->load('Activity') )
      unless $self->model;

    return $self->model->find(
        where => [ type => 'Task' ],
        limit => $limit || 10,
        order_by => 'created DESC'
    ) || undef;
}

1;
