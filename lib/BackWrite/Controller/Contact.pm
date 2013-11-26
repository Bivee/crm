package BackWrite::Controller::Contact;
use Mojo::Base 'BackWrite::Controller::Base';

use DateTime;
use BackWrite::API;

# public actions
sub index {
    shift->redirect_to('/contact/list');
}

sub create {
    my $self = shift;

    my $api = BackWrite::API->load('Contact');
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
        template => 'contact/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub edit {
    my $self = shift;

    my $api = BackWrite::API->load('Contact');
    eval { $api->edit( $self->_get_form, $self->is_post ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        template => 'contact/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub list {
    my $self = shift;

    my $list;
    my $api = BackWrite::API->load('Contact');
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

    my $api = BackWrite::API->load('Contact');
    eval { $api->remove( $self->_get_form ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->redirect_to('/contact/list');
}

1;
