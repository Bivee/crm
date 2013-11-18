package BackWrite::Controller::User;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use Digest::SHA1 qw/ sha1_hex /;
use BackWrite::Model;

# public actions
sub index {
    return shift->redirect_to('/user/list');
}

sub create {
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }

    # getting form data
    my $d = localtime();
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('User');

    if ( $self->is_post ) {

        # check email exists
        my $count = $model->count( where => [ email => $data->{email} ] );

        if ($count) {
            return $self->render(
                template => 'user/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'there are an user with same e-mail',
                },
            );
        }

        # store entry
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->create;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'user/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving user' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'user/form',
        model    => $model || {},
        message  => {
            class   => ( $model && $model->column('id') )
                ?'alert alert-success': '',
            text    => ( $model && $model->column('id') )
                ? 'user has been saved' : '',
        }
    );
}

sub edit {
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }

    # getting form data
    my $id   = $self->param('id') || 0;
    my $data = $self->_get_form();

    my $model = BackWrite::Model->load('User');
    $model = $model->find( where => [ id => $id ], single => 1 ) || undef;

    if ( $self->is_post ) {

        # check email exists
        if($model && $model->column('email') ne $data->{email}){
            my $count = $model->count( where => [ email => $data->{email} ] );

            if ($count) {
                return $self->render(
                    template => 'user/form',
                    model    => $model || {},
                    message  => {
                        class   => 'alert alert-danger',
                        text    => 'there are an user with same e-mail',
                    },
                );
            }
        }

        # store entry
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'user/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving entry' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'user/form',
                model    => $model || {},
                message  => {
                    class   => ( $model && $model->column('id') )
                        ?'alert alert-success': '',
                    text    => ( $model && $model->column('id') )
                        ? 'entry has been saved' : '',
                }
            );
        }
    }

    return $self->render(
        template => 'user/form',
        model    => $model || {},
        message  => {}
    );
}

sub list {
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }

    my $model = BackWrite::Model->load('User');
    return $self->render( list => $model->find || undef, );
}

sub remove {
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }

    # form data
    my $id = $self->param('id') || 0;

    # load entry
    my $model = BackWrite::Model->load('User');
    $model = $model->find( where => [ id => $id ], single => 1 ) || undef;
    $model->delete if $model;

    return $self->redirect_to('/user/list');
}

# private methods
sub _get_form {
    my $self = shift;

    my $user = $self->current_user;

    return {
        name        => $self->param('name')      || undef,
        email       => $self->param('email')     || undef,
        password    => $self->param('password')  || undef,
        image       => sha1_hex($self->param('email')) || undef,
        about       => $self->param('about')     || undef,
        lang        => $self->param('lang')      || 'en',
        active      => $self->param('active')    || 1,
      } || undef;
}

1;
