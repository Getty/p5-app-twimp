package App::Twimp;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
	Unicode::Encoding
    ConfigLoader
    Static::Simple
/;

extends 'Catalyst';

our $VERSION ||= '0.0development';

__PACKAGE__->config(
    name => 'App::Twimp',
    disable_component_resolution_regex_fallback => 1,
);

# Start the application
__PACKAGE__->setup();

=head1 SYNOPSIS

    script/app_twimp_server.pl

=cut

1;
