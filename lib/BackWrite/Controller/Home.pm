package BackWrite::Controller::Home;
use Mojo::Base 'BackWrite::Controller::Base';

use BackWrite::Model;

sub index {
    return (shift)->redirect_to('/account/signin');
    #my $self = shift;

    ## load entry
    #my $model = BackWrite::Model->load('Entry');
    #$model = $model->find( where => [ home => 1 ], single => 1);

    ## error
    #die "Home entry retrieve error" if $model and $model->error;
    #
    #if($model){
    #    my $mt = Mojo::Template->new;

    #    return $self->render( 
    #        text => $mt->render($model->column('content') || ''),
    #    );
    #}

    #return $self->render( list => $model->find || undef );
}

sub dashboard { 
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }
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
