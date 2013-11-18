package BackWrite::Service;
use Mojo::Base -strict;

sub load {
    my $class = shift;
    my %param = @_ if @_ % 2 == 0;

    my $ns = 'BackWrite::Service';
    my $service = $param{service} || $_[0];

    if($service){
        # build require
        my $module_load = $ns;
        $module_load =~ s/::/\//g;

        require "${module_load}/${service}.pm";
        my $instance = "${ns}::${service}"->new;
        
        return $instance 
            if $instance && $instance->isa('BackWrite::Service::Base');

        return undef;
    }
}

sub exists {
    die "Method unimplemented!";
}

1;

__END__
=pod 

=head1 NAME

BackWrite::Model - Model factory for BackWrite app


=head1 SINOPSYS

    use BackWrite::Model;

    # getting new instance of User model if exists
    my $user_model = BackWrite::Model->load('User');


=head1 DESCRIPTION

This class is a simple factory that load and instanciate for provide a simple
way to get new instances of L<BackWrite> model classes.

This class is auto configured to find model classes under L<BackWrite::Model>
namespace.


=head2 Methods


=head3 load(C<$scalar>)

This method get a class name, find under namespace and (if exists) return an
instance of class if it is a son class of BackWrite::Model::Base

    package BackWrite::Model::User;
    use base 'BackWrite::Model::Base';

    # use here your favorite ORM our handle manually
    ...

And now you can load User class doing:

    use BackWrite::Model;

    # get BackWrite::Model::User class instance
    my $user_model = BackWrite::Model->load('User');


=head3 exists(C<$scalar>)

This method returns if class exists based on required inplementation.

    my $user_model;

    # load user model if exists
    $user_model = BackWrite::Model->load('User') 
        if BackWrite::Model->exists('User');


=head1 AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
