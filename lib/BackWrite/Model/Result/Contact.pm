use utf8;
package BackWrite::Model::Result::Contact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BackWrite::Model::Result::Contact

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

=head1 TABLE: C<contact>

=cut

__PACKAGE__->table("contact");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 job

  data_type: 'text'
  is_nullable: 1

=head2 company

  data_type: 'text'
  is_nullable: 1

=head2 street

  data_type: 'text'
  is_nullable: 1

=head2 city

  data_type: 'text'
  is_nullable: 1

=head2 state

  data_type: 'text'
  is_nullable: 1

=head2 zip

  data_type: 'text'
  is_nullable: 1

=head2 type

  data_type: 'text'
  is_nullable: 1

=head2 email

  data_type: 'text'
  is_nullable: 1

=head2 website

  data_type: 'text'
  is_nullable: 1

=head2 phone

  data_type: 'text'
  is_nullable: 1

=head2 mobile

  data_type: 'text'
  is_nullable: 1

=head2 active

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

=head2 author

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
  "name",
  { data_type => "text", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "job",
  { data_type => "text", is_nullable => 1 },
  "company",
  { data_type => "text", is_nullable => 1 },
  "street",
  { data_type => "text", is_nullable => 1 },
  "city",
  { data_type => "text", is_nullable => 1 },
  "state",
  { data_type => "text", is_nullable => 1 },
  "zip",
  { data_type => "text", is_nullable => 1 },
  "type",
  { data_type => "text", is_nullable => 1 },
  "email",
  { data_type => "text", is_nullable => 1 },
  "website",
  { data_type => "text", is_nullable => 1 },
  "phone",
  { data_type => "text", is_nullable => 1 },
  "mobile",
  { data_type => "text", is_nullable => 1 },
  "active",
  { data_type => "integer", default_value => 1, is_nullable => 1 },
  "author",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F1yCDjWpNCdjWvaZKsXEwg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
