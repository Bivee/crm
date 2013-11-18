package BackWrite::Controller::Contact;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use BackWrite::Model;

# public actions
sub index {
    shift->redirect_to('/contact/list');
}

sub create {
    my $self = shift;

    # getting form data
    my $d    = localtime();
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Contact');

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->create;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'contact/form',
                model    => $model || {},
                message  => {
                    class => 'alert alert-danger',
                    text  => 'database error saving entity' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'contact/form',
        model    => $model || {},
        message  => {
            class => ( $model && $model->column('id') ) ? 'alert alert-success'
            : '',
            text => ( $model && $model->column('id') ) ? 'entity has been saved'
            : '',
        }
    );
}

sub edit {
    my $self = shift;

    # getting form data
    my $d    = localtime();
    my $id   = $self->param('id') || 0;
    my $data = $self->_get_form();
    $data->{updated} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Contact');
    $model = $model->find( where => [ id => $id ], single => 1 ) || undef;

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'contact/form',
                model    => $model || {},
                message  => {
                    class => 'alert alert-danger',
                    text  => 'database error saving entity ' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'contact/form',
                model    => $model || {},
                message  => {
                    class => ( $model && $model->column('id') )
                    ? 'alert alert-success'
                    : '',
                    text => ( $model && $model->column('id') )
                    ? 'entity has been saved'
                    : '',
                }
            );
        }
    }

    return $self->render(
        template => 'contact/form',
        model    => $model || {},
        message  => {}
    );
}

sub list {
    my $self = shift;

    # load user
    my $user = $self->current_user;

    # retrieve taskes
    my $model = BackWrite::Model->load('Contact');
    return $self->render( list => $model->find || undef );
}

sub remove {
    my $self = shift;

    # signedin user
    my $user = $self->current_user;

    # form data
    my $id = $self->param('id') || 0;

    # load task
    my $model = BackWrite::Model->load('Contact');
    $model = $model->find(
        where  => [ id => $id ],
        single => 1
    ) || undef;

    $model->delete if $model;
    return $self->redirect_to('/contact/list');
}

# private methods
sub _get_form {
    my $self = shift;

    my $model = BackWrite::Model->load('Contact');
    my %params = map{ 
        $_ => $self->param($_) || undef 
    } @{$model->columns};

    #    qw/ name description job company street city 
    #        state zip type email website phone mobile 
    #        active author updated created/;

    $params{author} = $self->current_user->column('id') || 0;

    return \%params || {};

    #return {
    #    name        => $self->param('name')        || undef,
    #    description => $self->param('description') || undef,
    #    job         => $self->param('job')         || undef,
    #    company     => $self->param('company')     || undef,
    #    street      => $self->param('street')      || undef,
    #    city        => $self->param('city')        || undef,
    #    state       => $self->param('state')       || undef,
    #    zip         => $self->param('zip')         || undef,
    #    type        => $self->param('type')        || undef,
    #    email       => $self->param('email')       || undef,
    #    website     => $self->param('website')     || undef,
    #    phone       => $self->param('phone')       || undef,
    #    mobile      => $self->param('mobile')      || undef,
    #    active      => $self->param('active')      || 1,
    #    author      => $user->column('id')         || 0,
    #  }
    #  || undef;
}

1;
