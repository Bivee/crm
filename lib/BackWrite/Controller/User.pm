package BackWrite::Controller::User;
use Mojo::Base 'BackWrite::Controller::Base';

use DateTime;
use Digest::SHA1 qw/ sha1_hex /;
use BackWrite::API;

# public actions
sub index {
    return shift->redirect_to('/user/list');
}

sub create {
    my $self = shift;

    my $api = BackWrite::API->load('User');
    if($self->is_post){
    
    }
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
        template => 'user/form',
        model    => undef,
        message  => $api->message,
    );
}

sub edit {
    my $self = shift;

    my $api = BackWrite::API->load('User');
    eval { $api->edit( $self->_get_form, $self->is_post ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        template => 'user/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub list {
    my $self = shift;

    my $list;
    my $api = BackWrite::API->load('User');
    eval { $list = $api->list( $self->_get_form ); };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    #use Data::Dumper;
    #return $self->render( text => Dumper $list );

    return $self->render(
        list => $list || undef,
        message => $api->message,
    );
}

sub remove {
    my $self = shift;

    my $api = BackWrite::API->load('User');
    eval { $api->remove( $self->_get_form ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->redirect_to('/user/list');
}

1;
