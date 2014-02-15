package BackWrite::Controller::Base;
use Mojo::Base 'Mojolicious::Controller';

use BackWrite::Authorization;

# methods
sub is_post {
    return (shift)->req->method eq 'POST' ? 1 : 0;
}

sub http_method {
    return (shift)->req->method;
}

sub _get_form {
    my $self = shift;

    my $params;

    # load params
    my @keys = $self->param;
    $params->{$_} = $self->param($_) || undef for @keys;

    # load current user
    $params->{current_user} = $self->current_user || undef;
    $params->{author} = $self->current_user->id || undef;

    # load id if specific actions
    $params->{id} = $self->param('id') || undef
      unless $self->stash('action') ~~ qw/create/;

    $params->{updated} = DateTime->now( time_zone => 'local' )
      if $self->stash('action') ~~ qw/edit/;

    # get datetime if created
    $params->{created} = DateTime->now( time_zone => 'local' )
      if $self->stash('action') eq 'create';

    return $params || {};
}

1;
