package BackWrite::Controller::Project;
use Mojo::Base 'BackWrite::Controller::Base';

use DateTime;
use BackWrite::API;

# public actions
sub index {
    shift->redirect_to('/project/list');
}

sub create {
    my $self = shift;

    my $api = BackWrite::API->load('Project');
    eval {

        # create new
        $api->create( $self->_get_form )
          if $self->is_post;
    };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        template => 'project/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub edit {
    my $self = shift;

    my $api = BackWrite::API->load('Project');
    eval { $api->edit( $self->_get_form, $self->is_post ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        template => 'project/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub list {
    my $self = shift;

    my $list;
    my $api = BackWrite::API->load('Project');
    eval { $list = $api->list( $self->_get_form ); };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        list => $list || undef,
        message => $api->message,
    );
}

sub remove {
    my $self = shift;

    my $api = BackWrite::API->load('Project');
    eval { $api->remove( $self->_get_form ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->redirect_to('/project/list');
}

1;
