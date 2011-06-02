use strict; # make perlcritic happy
package Dancer::Plugin::CouchDB;

use Dancer ':syntax';
use Dancer::Plugin;

use CouchDB::Client;

my $connection;

register couch => sub {
    unless($connection) {
        my $settings = plugin_setting;
        $connection = CouchDB::Client->new(%$settings);
    }
    return $connection;
};

register_plugin;

__END__

# ABSTRACT: A brief description of your module goes here

=head1 SYNOPSIS

  use Dancer ':syntax';
  use Dancer::Plugin::CouchDB;

  get '/' => sub {
    my $doc = couch->newDB('pages')->newDoc('my-page');
    $doc->retrieve;
    return $doc->data->{'title'};
  };

=head1 DESCRIPTION

This module provides a Dancer plugin for connecting to a CouchDB
instance.

=head1 CONFIGURATION

Accepts the same configuration options as L<CouchDB::Client>.

=head1 FUNCTIONS

Exports the C<couch> function into your web application.

=head1 SEE ALSO

L<CouchDB::Client>

=cut
