use utf8;
package BackWrite::Model::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BackWrite::Model::Result::User

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

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: 'text'
  is_nullable: 0

=head2 password

  data_type: 'text'
  is_nullable: 0

=head2 role

  data_type: 'varchar'
  default_value: null
  is_nullable: 1

=head2 image

  data_type: 'text'
  is_nullable: 1

=head2 lang

  data_type: 'text'
  default_value: 'en'
  is_nullable: 1

=head2 about

  data_type: 'text'
  is_nullable: 1

=head2 token

  data_type: 'text'
  default_value: null
  is_nullable: 1

=head2 change

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 active

  data_type: 'text'
  default_value: 1
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "text", is_nullable => 0 },
  "password",
  { data_type => "text", is_nullable => 0 },
  "role",
  { data_type => "varchar", default_value => \"null", is_nullable => 1 },
  "image",
  { data_type => "text", is_nullable => 1 },
  "lang",
  { data_type => "text", default_value => "en", is_nullable => 1 },
  "about",
  { data_type => "text", is_nullable => 1 },
  "token",
  { data_type => "text", default_value => \"null", is_nullable => 1 },
  "change",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "active",
  { data_type => "text", default_value => 1, is_nullable => 1 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OaKDCmiqbbSFjRdQoq9rRQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
