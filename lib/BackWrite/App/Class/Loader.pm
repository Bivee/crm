# Bivee CRM (r) Open Source (C) 2013-2014 Bivee, Ltda.
# This program is distributed under the terms of the
# GNU General Public License, version 2.

package BackWrite::App::Class::Loader;
use Mojo::Base -strict;

sub load {
    my ($class, $package, @args) = @_;

    # build require
    my $module_load = $package;
    $module_load =~ s/::/\//g;

    my $loaded;
    map{
        $loaded = 1 if $_ eq $module_load
    } keys %INC;

    my $instance;
    eval {
        require "${module_load}.pm" unless $loaded;
        $instance = "${package}"->new;
    };
    
    return $instance;
}

sub exists {
    my ($class, $package) = @_;

    # build require
    my $module_load = $package;
    $module_load =~ s/::/\//g;

    my $instance;
    eval {
        require "${module_load}.pm";
    };
    
    return ($@)? 0: 1;
}

1;
__END__

=pod 

=head1 NAME

BackWrite::App::Class::Loader - BackWrite Class Loader


=head1 SYNOPSIS

    use BackWrite::App::Class::Loader;

    # load class
    my $obj = BackWrite::App::Class::Loader->load('BackWrite');

    # class exists
    if(BackWrite::App::Class::Loader->exists('BackWrite')){
        say "BackWrite class exists!";
    }


=head1 DESCRIPTION

This is a simple class that have ability to load other classes in runtime.


=head2 load

    my $object = BackWrite::App::Class::Loader->load('BackWrite::Model::User');

You can use this method to load classes by name.


=head2 exists

    if(BackWrite::App::Class::Loader->exists('BackWrite')){
        say "BackWrite class exists!";
    }

Use this method to load and test if class exists.

This method will load your class and get the die if it isnt exists to return a true 
or false value.


=head1 AUTHOR

2013 (c) Bivee

L<http://bivee.com.br>


=head3 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Bivee.

This is a free software; you can redistribute it and/or modify it under the same terms of Perl 5 programming 
languagem system itself.

=cut
