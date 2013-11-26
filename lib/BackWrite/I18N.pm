package BackWrite::I18N;
use Mojo::Base -strict;

use FindBin;
use File::Basename qw/dirname/;
use BackWrite::App::Class::Loader;

sub load {
    my ( $class, $package, @args ) = @_;
    
    # TODO make this classes single tons
    my $instance = 
        BackWrite::App::Class::Loader->load("BackWrite::I18N::${package}");

    return $instance
      if $instance && $instance->isa('BackWrite::I18N::Base');
}

sub list_langs {
    my $class = shift;
   
    # getting dir
    my $dir = dirname $INC{'BackWrite/I18N/Base.pm'};

    my $langs;
    eval {
        opendir my $dh, "${dir}/" or die $!;
        @$langs = grep { /\.pm$/ && !/Base\.pm/ } readdir $dh;
        close $dh;
    };

    return $langs || [];
}

sub exists {
    my ( $class, $lang ) = @_;
    return BackWrite::App::Class::Loader->exists("BackWrite::I18N::${lang}")
        if $lang;
}

1;
