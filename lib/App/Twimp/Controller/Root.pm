package App::Twimp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub base :Chained('/') :PathPart('') :CaptureArgs(0) {
    my ( $self, $c ) = @_;
	$c->stash->{version} = $App::Twimp::VERSION;
}

sub index :Chained('base') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
}

sub default :Chained('base') :PathPart('') :Args {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
