package BackWrite::Helpers;
use Mojo::Base -strict;

use BackWrite::Model;

sub register {
    my ( $class, %params ) = @_;

    my $app = $params{context} || undef;

    $app->helper(
        'schema' => sub {
            return BackWrite::Model->init_db;
        }
    );

    # TODO pack into plugin
    $app->helper(
        'lang' => sub {
            my ($c, $lang) = @_;
            $c->session( lang => $lang? $lang: 'en' );
        }
    );

    # TODO pack into plugin
    $app->helper(
        'l' => sub {
            my ($c, $key) = @_;

            my $lang = 'en';
            $lang = $c->session('lang') if $c->session('lang');
            
            my $l = BackWrite::I18N->load( $lang );
            return $l? $l->key( $key ): $key;
        }
    );

    # TODO pack into plugin
    $app->helper(
        'r' => sub {
            my $l = BackWrite::I18N->load( shift->session('lang') || 'eng' );
            return $l->key('replace_for')->{ $_[0] } || '';
        }
    );

    use BackWrite::App::DateTime;
    $app->helper(
        'datetime' => sub {
            return BackWrite::App::DateTime->parse( $_[1] ) || undef;
        }
    );

    $app;
}

1;
