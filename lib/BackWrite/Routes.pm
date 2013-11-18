package BackWrite::Routes;
use Mojo::Base -strict;

sub load {
    my ( $class, $route ) = @_;

    # error
    die "error with route instance!\n"
      unless $route && $route->isa('Mojolicious::Routes');

    # custom routes
    my $custom = {
        '/dashboard' => 
            {controller=>'Home', action=>'dashboard', authenticated=>1},
        
        '/profile' => 
            {controller=>'Home', action=>'profile', authenticated=>1},

        '/:controller/:action/:id' => 
            {controller=>'Home', action=>'index', id=>0},

        #add custom route here
    };

    # add routes
    #$route->any($_)->to( $custom->{$_} ) for keys %$custom;
    $route->any($_)->over(authenticated => $custom->{$_}->{authenticated} || 0)->to( $custom->{$_} )
        for keys %$custom;

    return $route;
}

1;

__END__
=pod 

=head1 NAME

BackWrite::Routes - Route container for BackWrite app


=head1 DESCRIPTION

This class is a simple container where you will add all your custom routes 
used at your BackWrite app.


=head2 Methods


=head3 load(L<Mojolicious::Routes> instance)

    package BackWrite::Routes;

    # config custom routes to Mojolicious::Routes
    my $r = $self->routes;
    BackWrite::Routes->load($r);


=head1 AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
                                                                                                                                                                                            =pod

                                                                                                                                                                                            =head1 NAME

                                                                                                                                                                                            Site::Routes

                                                                                                                                                                                            =head1 DESCRIPTION

                                                                                                                                                                                            Classe responsável pela configuração de todas as rotas
                                                                                                                                                                                            customizadas da aplicação.

                                                                                                                                                                                            Utilize esta classe sempre que necessário adicionar uma
                                                                                                                                                                                            nova rota neste site.

                                                                                                                                                                                            =head1 SEE ALSO

                                                                                                                                                                                            L<Mojolicious>, L<Mojolicious::Routes>

                                                                                                                                                                                            =cut
