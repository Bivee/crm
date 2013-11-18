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

sub allow_to {
    my ($self, $roles, $redirect) = @_;
    
    return BackWrite::Authorization->allow_to(
        $roles, $self, $redirect || undef
    );
}

1;

__END__
