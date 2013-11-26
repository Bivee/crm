# Bivee CRM (r) Open Source (C) 2013-2014 Bivee, Ltda.
# This program is distributed under the terms of the
# GNU General Public License, version 2.

package BackWrite;
use Mojo::Base 'Mojolicious';

use BackWrite::I18N;
use BackWrite::Routes;
use BackWrite::Helpers;
use BackWrite::Authentication;

sub startup {
    my $self = shift;

    # register plugins
    BackWrite::Helpers->register( context => $self );

    $self->plugin(
        # authentication plugin
        'authentication' => {
            'autoload_user' => 1,
            'session_key'   => 'my_backwrite_bitch',
            'load_user'     => sub {
                return BackWrite::Authentication->load_user(@_);
            },
            'validate_user' => sub {
                return BackWrite::Authentication->validate_user(@_);
            },
        },
        # TODO authorization plugin
        #'role' => { 
        #    load_role => sub { 
        #        return BackWrite::Authorizarion->load_roles(@_);
        #    }
        #},
        # TODO i18n plugin
        #'i18n' => { default => 'en', namespace => 'BackWrite::I18N' }
    );

    # Router
    my $r = $self->routes;
    $r->namespaces( ['BackWrite::Controller'] );

    # default route to controller
    $r->get('/')->to('Home#index');

    BackWrite::Routes->load($r);
}

1;
__END__

=pod 

=head1 NAME

Bivee CRM - Bivee CRM solution based on Bivee BackWrite CMS


=head1 DESCRIPTION

This is a Bivee CRM solution.

Bivee CRM is a complete CRM solution implemented using Perl 5 programming language
for companies that use Perl or some companies that want to have a simple CRM 
system that works great and easy to costumize.


=head2 Why?

We need a good CRM software solution made in Perl and thats just works!


=head2 Some Features!

=over

=item Simple Screens

The system screens is very easy to use and can be used for every one.

=item Localization

Can works with a many language as you need and if its dont have a native translation
you can make your own.

=item Activities 

See all activities of you or your team doing at moment.

=item Information Export

You can export your data in many diferent formats for integration, backups, etc.

=back


=head1 BUG

This software have some bugs or need some improvements as all large software solution.
If you found one bug or wanna make a feature request, please send an email to
support@bivee.com.br and type "Bivee CRM BUG|FEATURE" on message subject.

If you wanna send your personal report about this software solution you will send a 
message to dev@bivee.com.br


=head1 AUTHOR

2013 (c) Bivee

L<http://bivee.com.br>


=head3 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Bivee.

This is a free software; you can redistribute it and/or modify it under the same terms of Perl 5 programming 
languagem system itself.

=cut
