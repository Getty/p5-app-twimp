package App::Twimp::Model::Twitch;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

=head1 NAME

App::Twimp::Model::Twitch - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

Torsten Raudssus,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
