package BackWrite::Controller::Champaign;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use BackWrite::Model;

# public actions
sub index {
    shift->redirect_to('/champaign/list');
}

sub create {
    my $self = shift;

    # getting form data
    my $d = localtime();
    my $data = $self->_get_form();
    $data->{created} = join( 'T', ( $d->ymd('-'), $d->hms ) ) || undef;

    my $model = BackWrite::Model->load('Champaign');

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->create;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'champaign/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving champaign' . $model->error,
                },
            );
        }
    }

    return $self->render(
        template => 'champaign/form',
        model    => $model || {},
        message  => {
            class   => ( $model && $model->column('id') )
                ?'alert alert-success': '',
            text    => ( $model && $model->column('id') )
                ? 'champaign has been saved' : '',
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

    my $model = BackWrite::Model->load('Champaign');
    $model = $model->find( where => [ id => $id ], single => 1 ) || undef;

    if ( $self->is_post ) {

        # store task
        $model->column( $_, $data->{$_} ) for keys %$data;
        $model->update;

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'champaign/form',
                model    => $model || {},
                message  => {
                    class   => 'alert alert-danger',
                    text    => 'database error saving champaign' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'champaign/form',
                model    => $model || {},
                message  => {
                    class   => ( $model && $model->column('id') )
                        ?'alert alert-success': '',
                    text    => ( $model && $model->column('id') )
                        ? 'champaign has been saved' : '',
                }
            );
        }
    }

    return $self->render(
        template => 'champaign/form',
        model    => $model || {},
        message  => {}
    );
}

sub list {
    my $self = shift;

    # load user
    my $user = $self->current_user;

    # retrieve taskes
    my $model = BackWrite::Model->load('Champaign');
    my $page = $self->param('id') || 1;
    my $last_page = $model->count;

    return $self->render( 
        list => $model->find( page => $page, page_size => 5 ) || undef,
        last_page => ($last_page > 5) ? ($last_page / 5): 1,
        page => $page,
    );
}

sub remove {
    my $self = shift;

    # signedin user
    my $user = $self->current_user;

    # form data
    my $id = $self->param('id') || 0;

    # load task
    my $model = BackWrite::Model->load('Champaign');
    $model = $model->find( 
        where => [ id => $id ],  single => 1 
    ) || undef;

    $model->delete if $model;
    return $self->redirect_to('/champaign/list');
}

# private methods
sub _get_form {
    my $self = shift;

    return {
        name        => $self->param('name')        || undef,
        description => $self->param('description') || undef,
        status      => $self->param('status')      || undef,
        start       => $self->param('start')       || undef,
        finish      => $self->param('finish')      || undef,
        finished    => $self->param('finished')    || 0,    
        type        => $self->param('type')        || 0,    
      }
      || undef;
}

1;
