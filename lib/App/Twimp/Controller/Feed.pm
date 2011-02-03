package App::Twimp::Controller::Feed;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => 'feed');

sub base :Chained('/base') :PathPart('feed') :CaptureArgs(0) {}

sub index :Chained('base') :PathPart('') :Args(0) {
    my ( $self, $c ) = @_;
	my $feed_url = $c->req->param('feed_url');
	if ($feed_url) {
		$feed_url =~ s!feed://!http://!g;
		$c->stash->{feed_url} = $feed_url;
		$c->stash->{feed} = $c->model('Feed')->feed($c->stash->{feed_url});
	}
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
