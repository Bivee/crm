use utf8;
package BackWrite::Model::Result::Note;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BackWrite::Model::Result::Note

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<note>

=cut

__PACKAGE__->table("note");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 0

=head2 content

  data_type: 'text'
  is_nullable: 1

=head2 tags

  data_type: 'text'
  is_nullable: 1

=head2 author

  data_type: 'integer'
  is_nullable: 0

=head2 updated

  data_type: 'datetime'
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "content",
  { data_type => "text", is_nullable => 1 },
  "tags",
  { data_type => "text", is_nullable => 1 },
  "author",
  { data_type => "integer", is_nullable => 0 },
  "updated",
  { data_type => "datetime", is_nullable => 1 },
  "created",
  { data_type => "datetime", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-02-11 21:45:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1rCNPszwWCHjFVIaBGldqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
