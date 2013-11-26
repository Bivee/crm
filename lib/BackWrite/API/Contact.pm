package BackWrite::API::Contact;
use Mojo::Base 'BackWrite::API::Base';

use DateTime;
use BackWrite::Model;

# attributes
has 'model' => sub { BackWrite::Model->load('Contact') };
has 'param';

# methods
sub create {
    my ( $self, $param ) = @_;

    # load params
    $self->param($param);

    # load model
    $self->model( BackWrite::Model->load('Contact') )
      unless $self->model;

    # setting columns and store
    $self->model->column( $_, $self->param->{$_} ) for keys %{ $self->param };
    $self->model->create;

    # error
    if ( $self->model && $self->model->error ) {
        $self->message( {
            class => 'alert alert-danger',
            text  => 'database error saving entity' . $self->model->error,
        });
    }
    else {
        $self->message( {
            class => ( $self->model && $self->model->column('id') )
            ? 'alert alert-success' : '',
            text => ( $self->model && $self->model->column('id') )
            ? 'entity has been saved' : '',
        });

        eval {
            my $activity = BackWrite::API->load('Activity');
            $activity->create( {
                user    => $self->param->{author},
                action  => 'creates',
                type    => 'Contact',
                created => DateTime->now,
            });
        };
    }

    $self;
}

sub edit {
    my ( $self, $param, $is_post ) = @_;

    # load params
    $self->param($param);

    # get model instance
    $self->model( BackWrite::Model->load('Contact') )
      unless $self->model;

    my $model = $self->model->find(
        where  => [ id => $self->param->{id} ],
        single => 1
    ) || undef;

    $self->model($model);

    # return if is get http method
    return $self unless $is_post;

    if ( $self->model ) {
        $self->model->column( $_, $self->param->{$_} )
          for keys %{ $self->param };
        $self->model->update;
    }

    # error
    if ( $self->model && $self->model->error ) {
        $self->message(
            {
                class => 'alert alert-danger',
                text  => 'database error saving entity' . $self->model->error,
            }
        );
    }
    else {
        $self->message({
            class => ( $self->model && $self->model->column('id') )
            ? 'alert alert-success' : '',
            text => ( $self->model && $self->model->column('id') )
            ? 'entity has been saved' : '',
        });

        eval {
            my $activity = BackWrite::API->load('Activity');
            $activity->create({
                user    => $self->param->{author},
                action  => 'edits',
                type    => 'Contact',
                created => DateTime->now,
            });
        };
    }

    $self;
}

sub list {
    my ( $self, $param ) = @_;

    # load params
    $self->param($param);

    # get model instance
    $self->model( BackWrite::Model->load('Contact') )
      unless $self->model;

    return $self->model->find || undef;
}

sub remove {
    my ( $self, $param ) = @_;

    # load params
    $self->param($param);

    # get model instance
    $self->model( BackWrite::Model->load('Contact') )
      unless $self->model;

    my $model = $self->model->find(
        where  => [ id => $self->param->{id} ],
        single => 1
    ) || undef;

    $model->delete if $model; 
    
    eval {
        my $activity = BackWrite::API->load('Activity');
        $activity->create({
            user    => $self->param->{author},
            action  => 'removes',
            type    => 'Contact',
            created => DateTime->now,
        });
    };

    $self;
}

1;
