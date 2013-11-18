package BackWrite::Controller::Website;
use Mojo::Base 'BackWrite::Controller::Base';

use Time::Piece;
use BackWrite::Model;

# public actions
sub index {
    return shift->redirect_to('/website/edit');
}

sub edit {
    my $self = shift;

    # check authorization
    unless( $self->allow_to(['admin']) ){
        return $self->render( text => 'Not Authorized', status => 403 );
    }

    # getting form data
    my $d = localtime;
    my $id = $self->param('id') || 0;
    my $data = $self->_get_form();
    $data->{update} = join 'T', ($d->ymd('-'), $d->hms);

    my $model = BackWrite::Model->load('Website');
    $model = $model->find( single => 1 ) || undef;

    if ( $self->is_post ) {

        # store entry
        if($model && $model->isa('BackWrite::Model::Base')){
            $model->column( $_, $data->{$_} ) for keys %$data;
            $model->update;
        }

        # error
        if ( $model && $model->error ) {
            return $self->render(
                template => 'website/form',
                model    => $model || undef,
                message  => {
                    class => 'alert alert-danger',
                    text  => 'database error saving website' . $model->error,
                },
            );
        }
        else {
            return $self->render(
                template => 'website/form',
                model    => $model || undef,
                message  => {
                    class => ( $model && $model->column('id') )
                    ? 'alert alert-success'
                    : '',
                    text => ( $model && $model->column('id') )
                    ? 'website has been saved'
                    : '',
                }
            );
        }
    }

    return $self->render(
        template => 'website/form',
        model    => $model || undef,
        message  => {}
    );
}

# private methods
sub _get_form {
    my $self = shift;

    my $user = $self->current_user;

    return {
        title       => $self->param('title')             || undef,
        author      => $self->param('author')            || undef,
        description => $self->param('description')       || undef,
        base_url    => $self->param('base_url')          || undef,
        maintenance => $self->param('maintenance')       || 0,
      }
      || undef;
}

1;
