package BackWrite::I18N::Base;
use Mojo::Base -base;

has 'Lexicon';

sub key {
    my ($self, $key) = @_;
    return $self->Lexicon->{$key} || '';
}

1;
