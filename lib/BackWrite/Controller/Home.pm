package BackWrite::Controller::Home;
use Mojo::Base 'BackWrite::Controller::Base';

use BackWrite::API;
use BackWrite::Model;

sub index {
    my $self = shift;

    # user signed out
    return $self->redirect_to('/account/signin')
        unless $self->current_user;

    return $self->redirect_to('/dashboard');
}

sub dashboard { 
    my $self = shift;

    my $activity; # = BackWrite::API->load('Activity');
    my $contacts; # = $activity->contact_list(3);
    my $tasks   ; # = $activity->task_list(3);

    $self->stash(
        contacts => $contacts || [],
        tasks    => $tasks    || [],
    );
}

sub profile {
    my $self = shift;

    # load user
    my $model = $self->current_user;
    my $data  = {
        name  => $self->param('name')  || undef,
        email => $self->param('email') || undef,
        about => $self->param('about') || undef,
    };

    if ( $self->is_post ) {

        # check email exists
        if ( $model && $model->column('email') ne $data->{email} ) {
            my $count = $model->count( where => [ email => $data->{email} ] );

            if ($count) {
                return $self->render(
                    model => $model || {},
                    message => {
                        class => 'alert alert-danger',
                        text  => 'there are an user with same e-mail',
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
                model => $model || {},
                message => {
                    class => 'alert alert-danger',
                    text  => 'database error saving entry' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                model => $model || {},
                message => {
                    class => ( $model && $model->column('id') )
                    ? 'alert alert-success'
                    : '',
                    text => ( $model && $model->column('id') )
                    ? 'entry has been saved'
                    : '',
                }
            );
        }
    }

    return $self->render(
        model => $model || {},
        message => {}
    );
}

1;
