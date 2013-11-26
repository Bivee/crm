package BackWrite::API;
use Mojo::Base -strict;

use BackWrite::App::Class::Loader;

sub load {
    my ( $class, $package, @args ) = @_;

    my $instance = 
        BackWrite::App::Class::Loader->load("BackWrite::API::${package}");

    return $instance
      if $instance && $instance->isa('BackWrite::API::Base');
}

sub exists {
    my ( $class, $package ) = @_;
    return BackWrite::App::Class::Loader->exists("BackWrite::API::${package}")
        if $package;
}

1;
