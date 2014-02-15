use utf8;

package BackWrite::Model;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;

# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-02-11 21:45:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fzIQXODT7EhJ+CC3fpQPXg

sub init_db {
    return shift->connect( 'dbi:SQLite:dbname=database.db', undef, undef );
}


1;
