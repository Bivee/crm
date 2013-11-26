package BackWrite::Controller::Api;
use Mojo::Base 'BackWrite::Controller::Base';

#use BackWrite::API;
use BackWrite::Model;

# methods
sub index {
    my $self = shift;

    # get api name to load
    my $api = $self->param('api') || undef;

    # load an api, run and return an end point action
    my $api = BackWrite::API->load($api);
    return $api->end_point( context => $self );
}

1;
__END__

=pod 

=head1 NAME

=head1 DESCRIPTION

=head2 ACCESSORS

=head2 METHODS

=head1 BUG

This software have some bugs or need some improvements as all large software solution.
If you found one bug or wanna make a feature request, please send an email to
support@bivee.com.br and type "Bivee CRM BUG|FEATURE" on message subject.

If you wanna send your personal report about this software solution you will send a 
message to dev@bivee.com.br


=head1 AUTHOR

2013 (c) Bivee

L<http://bivee.com.br>

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head3 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Bivee.

This is a free software; you can redistribute it and/or modify it under the same terms of Perl 5 programming 
languagem system itself.

=cut
