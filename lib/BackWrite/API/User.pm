package BackWrite::API::User;
use Mojo::Base 'BackWrite::API::Base';

use DateTime;
use BackWrite::Model;

# attributes
has 'model' => sub { BackWrite::Model->init_db->resultset('User') };
has 'param';

# methods
sub create {
    my ( $self, $param ) = @_;

    # setting columns and store
    my $model = $self->model->create({
        name     => $param->{name},
        email    => $param->{email},
        password => $param->{password},
        role     => $param->{role},
        image    => $param->{image},
        lang     => $param->{lang},
        about    => $param->{about},
        token    => $param->{token},
        change   => $param->{change},
        active   => $param->{active},
        created  => $param->{created},
    });

    # error
    unless ( $model && $model->in_storage ) {
        $self->message( {
            class => 'alert alert-danger',
            text  => 'database error saving user ' . $self->model->error,
        });
    }
    else {
        $self->message( {
            class => ( $self->model && $self->model->column('id') )
            ? 'alert alert-success' : '',
            text => ( $self->model && $self->model->column('id') )
            ? 'user has been saved' : '',
        });
    }

    $self;
}

sub edit {
    my ( $self, $param, $is_post ) = @_;

    # load
    my $model = $self->model->find($param->{id});
    $self->model($model);

    # return if is get http method
    return $self unless $is_post;

    if ( $self->model ) {
        my $model = $self->model->update({
            name     => $param->{name},
            email    => $param->{email},
            password => $param->{password},
            role     => $param->{role},
            image    => $param->{image},
            lang     => $param->{lang},
            about    => $param->{about},
            token    => $param->{token},
            change   => $param->{change},
            active   => $param->{active},
            created  => $param->{created},
        });
    }

    # error
    if ( $self->model ) {
        $self->message(
            {
                class => 'alert alert-danger',
                text  => 'database error saving user ' . $self->model->error,
            }
        );
    }
    else {
        $self->message({
            class => ( $self->model && $self->model->column('id') )
            ? 'alert alert-success' : '',
            text => ( $self->model && $self->model->column('id') )
            ? 'user has been saved' : '',
        });
    }

    $self;
}

sub list {
    my ( $self, $param ) = @_;
    return $self->model->search || undef;
}

sub remove {
    my ( $self, $param ) = @_;

    my $model = $self->model->find($param->{id});
    $model->delete if $model; 
    
    $self;
}

1;
