package App::Twimp::Model::Feed;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model';

use HTTP::Request;
use XML::Feed;
use LWP::UserAgent;

has _agent => (
	is => 'rw',
	lazy => 1,
	default => sub {
		my $ua = LWP::UserAgent->new;
		$ua->agent('App::Twimp/'.$App::Twimp::VERSION);
		return $ua;
	},
);

sub feed {
	my ( $self, $url ) = @_;
	my $req = HTTP::Request->new(GET => $url);
	my $res = $self->_agent->request($req);
	
	my %feed;

	if ($res->is_success) {
		my $content = $res->content;
		my $xml_feed;
		eval {
			$xml_feed = XML::Feed->parse(\$content);
		};
		if ($@) {
			$feed{error} = 'XML Feed eval error: '.$@;			
		} elsif (!$xml_feed) {
			$feed{error} = 'XML Feed error: '.XML::Feed->errstr;
		} else {
			for ($xml_feed->entries) {
				my $url = $_->link;
				$url =~ s/ //g;
				push @{$feed{entries}}, {
					title => $_->title,
					url => $url,
				};
			}
		}
	} else {
		$feed{error} = 'HTTP Request error: '.$res->status_line;
	}
	
	return \%feed;
}

__PACKAGE__->meta->make_immutable;

1;
