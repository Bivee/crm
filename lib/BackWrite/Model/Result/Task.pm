use utf8;
package BackWrite::Model::Result::Task;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BackWrite::Model::Result::Task

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

=head1 TABLE: C<task>

=cut

__PACKAGE__->table("task");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 date

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 project

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 tags

  data_type: 'text'
  default_value: null
  is_nullable: 1

=head2 assigned

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 author

  data_type: 'integer'
  is_nullable: 0

=head2 finished

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

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
  "description",
  { data_type => "text", is_nullable => 1 },
  "date",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "project",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "tags",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
  "assigned",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "author",
  { data_type => "integer", is_nullable => 0 },
  "finished",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:v8cfpfCRLDuNEcKCQyF7cw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
