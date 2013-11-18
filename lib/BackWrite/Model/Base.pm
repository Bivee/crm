package BackWrite::Model::Base;
use Mojo::Base 'ObjectDB';

use DBI;
use Mojo::JSON;

our $dbh;

sub init_db {
    return $dbh if $dbh;

    #$dbh = DBI->connect('DBI:mysql:database=selc;host=localhost', 'root', '');
    $dbh = DBI->connect('DBI:SQLite:dbname=database.db', undef, undef);
    die $DBI::errorstr unless $dbh;

    return $dbh;
}

# TODO to_json
sub to_json {
    my $self = shift;
    #return Mojo::JSON->new->encode($self->to_hash);
}

# TODO to_xml
sub to_xml {
    my $self = shift;
}


1;
