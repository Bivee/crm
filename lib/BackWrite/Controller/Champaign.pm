package BackWrite::Controller::Champaign;
use Mojo::Base 'BackWrite::Controller::Base';

use DateTime;
use BackWrite::API;

# public actions
sub index {
    shift->redirect_to('/champaign/list');
}

sub create {
    my $self = shift;

    my $api = BackWrite::API->load('Champaign');
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
        template => 'champaign/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub edit {
    my $self = shift;

    my $api = BackWrite::API->load('Champaign');
    eval { $api->edit( $self->_get_form, $self->is_post ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->render(
        template => 'champaign/form',
        model    => $api->model,
        message  => $api->message,
    );
}

sub list {
    my $self = shift;

    my $list;
    my $api = BackWrite::API->load('Champaign');
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

    my $api = BackWrite::API->load('Champaign');
    eval { $api->remove( $self->_get_form ) };
    if ($@) {

        # TODO: remove this and render 500 status page
        return $self->render( text => $@ );
    }

    return $self->redirect_to('/Champaign/list');
}

# private methods
sub _get_form {
    my $self = shift;

    my $params;

    # load params
    my @keys = $self->param;
    $params->{$_} = $self->param($_) || undef for @keys;

    # load current user
    $params->{author} = $self->current_user->column('id') || undef;

    # load id if specific actions
    $params->{id} = $self->param('id') || undef
      unless $self->stash('action') ~~ qw/create list/;

    $params->{updated} = DateTime->now
      if $self->stash('action') ~~ qw/edit/;

    # get datetime if created
    $params->{created} = DateTime->now
      if $self->stash('action') eq 'create';

    return $params || {};
}
1;
