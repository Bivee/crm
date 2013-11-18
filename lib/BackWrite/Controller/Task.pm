package BackWrite::Controller::Task;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use BackWrite::Model;

# public actions
sub index {
    shift->redirect_to('/task/list');
}

sub create {
    my $self = shift;

    # getting form data
    my $d = localtime();
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Task');

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->create;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'task/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving task' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'task/form',
        model    => $model || {},
        message  => {
            class   => ( $model && $model->column('id') )
                ?'alert alert-success': '',
            text    => ( $model && $model->column('id') )
                ? 'task has been saved' : '',
        }
    );
}

sub edit {
    my $self = shift;

    # getting form data
    my $d = localtime();
    my $id   = $self->param('id') || 0;
    my $data = $self->_get_form();
    $data->{updated} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Task');
    $model = $model->find( where => [ id => $id ], single => 1 ) || undef;

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'task/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving task' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'task/form',
                model    => $model || {},
                message  => {
                    class   => ( $model && $model->column('id') )
                        ?'alert alert-success': '',
                    text    => ( $model && $model->column('id') )
                        ? 'task has been saved' : '',
                }
            );
        }
    }

    return $self->render(
        template => 'task/form',
        model    => $model || {},
        message  => {}
    );
}

sub list {
    my $self = shift;

    # load user
    my $user = $self->current_user;

    # retrieve taskes
    my $model = BackWrite::Model->load('Task');
    return $self->render( 
        list => $model->find( 
            where => [ 
                -or => [ 
                    author      => $user->column('id'), 
                    assigned    => $user->column('id') 
                ]
            ]
        ) || undef, 
    );
}

sub remove {
    my $self = shift;

    # signedin user
    my $user = $self->current_user;

    # form data
    my $id = $self->param('id') || 0;

    # load task
    my $model = BackWrite::Model->load('Task');
    $model = $model->find( 
        where => [ 
            -or => [ 
                author      => $user->column('id'), 
                assigned    => $user->column('id') 
            ]
        ], 
        single => 1 
    ) || undef;

    $model->delete if $model;
    return $self->redirect_to('/task/list');
}

# private methods
sub _get_form {
    my $self = shift;

    my $user = $self->current_user;

    return {
        title       => $self->param('title')       || undef,
        description => $self->param('description') || undef,
        date        => $self->param('date')        || undef,
        project     => $self->param('project')     || 0,
        tags        => $self->param('tags')        || undef,
        assigned    => $self->param('assigned')    || 0,    
        author      => ($user && $user->column('id'))? $user->column('id'): 0,
        finished    => $self->param('finished')    || 0,    
      }
      || undef;
}

1;
