package BackWrite::Controller::Account;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use Digest::SHA1 qw/ sha1_hex /;
use BackWrite::Model;

# public actions
sub index {
    return shift->redirect_to('/account/signin');
}

sub signin {
    my $self = shift;

    # form data
    my $model = {
        email    => $self->param('email')    || undef,
        password => $self->param('password') || undef,
    };

    if ( $self->is_post ) {

        # found user
        if($self->authenticate($model->{email}, $model->{password})){
            return $self->redirect_to('/dashboard');
        }
        else {
            $self->stash( message => 'email or password incorrect' );
        }
    }

    # default render
    return $self->render(
        model   => $model,
        error   => $self->stash('error') || '',
        message => $self->stash('message') || '',
    );
}

sub register {
    my $self = shift;

    my $d = localtime();
    # TODO check if user is admin

    # getting form data
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('User');

    if ( $self->is_post ) {

        # check email exists
        my $count = $model->count( where => [ email => $data->{email} ] );

        if ($count) {
            return $self->render(
                template => 'account/register',
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
                template => 'account/register',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving user' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'account/register',
        model    => $model || {},
        message  => {
            class   => ( $model && $model->column('id') )
                ?'alert alert-success': '',
            text    => ( $model && $model->column('id') )
                ? 'user has been saved' : '',
        }
    );
}

sub change {
    my $self = shift;

    my $d = localtime();

    # getting form data
    my $data = {
        password => $self->param('password') || undef,
        password_verification => $self->param('password_verification') || undef,
    };

    my $model;
    if ($self->is_user_authenticated){
        $model = $self->current_user;
    }
    else{
        $model = BackWrite::Model->load('User');
        $model = $model->find( 
            where => [token => $self->param('id') || undef], single => 1
        );
    }


    if ( $self->is_post ) {

        if ($data->{password_verification} ne $data->{password}) {
            return $self->render(
                template => 'account/change',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'passwords doesnt match',
                },
            );
        }

        # store entry
        $model->column( 'password', sha1_hex $data->{password} );
        $model->column( 'token', undef );
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'account/change',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving password' . $model->error,
                },
            );
        }

        return $self->render(
            template => 'account/change',
            model    => $model || {},
            message  => {
                class   => ( $model && $model->column('id') )
                    ?'alert alert-success': '',
                text    => ( $model && $model->column('id') )
                    ? 'password has been changed' : '',
            }
        );
    }

    return $self->render(
        template => 'account/change',
        model    => $model || {},
        message  => {},
    );
}

sub signout {
    my $self = shift;

    # user logout
    $self->logout();

    # redirect default
    return $self->redirect_to('/');
}


# private methods
sub _get_form {
    my $self = shift;

    my $user = $self->current_user;

    return {
        name        => $self->param('name')       || undef,
        email       => $self->param('email')    || undef,
        password    => $self->param('password') || undef,
        image       => sha1_hex($self->param('email')) || undef,
        active      => $self->param('active') || 1,
      } || undef;
}


1;
