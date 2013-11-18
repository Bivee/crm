package BackWrite::Controller::Note;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use BackWrite::Model;

# public actions
sub index {
    shift->redirect_to('/note/list');
}

sub create {
    my $self = shift;

    # getting form data
    my $d = localtime();
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Note');

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->create;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'note/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving note' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'note/form',
        model    => $model || {},
        message  => {
            class   => ( $model && $model->column('id') )
                ?'alert alert-success': '',
            text    => ( $model && $model->column('id') )
                ? 'note has been saved' : '',
        }
    );
}

sub edit {
    my $self = shift;

    my $user = $self->current_user;

    # getting form data
    my $d = localtime();
    my $id   = $self->param('id') || 0;
    my $data = $self->_get_form();
    $data->{updated} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Note');
    $model = $model->find( where => [ id => $id, author => $user->column('id') ], single => 1 ) || undef;

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'note/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving note' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'note/form',
                model    => $model || {},
                message  => {
                    class   => ( $model && $model->column('id') )
                        ?'alert alert-success': '',
                    text    => ( $model && $model->column('id') )
                        ? 'note has been saved' : '',
                }
            );
        }
    }

    return $self->render(
        template => 'note/form',
        model    => $model || {},
        message  => {}
    );
}

sub list {
    my $self = shift;

    # load user
    my $user = $self->current_user;

    # retrieve taskes
    my $model = BackWrite::Model->load('Note');
    return $self->render( 
        list => $model->find( 
            where => [ author => $user->column('id') || 0 ] 
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
    my $model = BackWrite::Model->load('Note');
    $model = $model->find( 
        where => [ id => $id, author => $user->column('id') ],
        single => 1 
    ) || undef;

    $model->delete if $model;
    return $self->redirect_to('/note/list');
}

# private methods
sub _get_form {
    my $self = shift;

    my $user = $self->current_user;

    return {
        title       => $self->param('title')       || undef,
        content     => $self->param('content')     || undef,
        tags        => $self->param('tags')        || undef,
        author      => ($user && $user->column('id'))? $user->column('id'): 0,
      }
      || undef;
}

1;
