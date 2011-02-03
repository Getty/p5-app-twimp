package App::Twimp::View::TT;

use Moose;

extends 'Catalyst::View::TT';

use Template::Stash::XS;
use File::ShareDir 'dist_dir';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
	INCLUDE_PATH => [
		App::Twimp->path_to( 'templates' ),
#		dist_dir('App-Twimp').'/templates',
	],
	PLUGIN_BASE => 'SyContent::Template::Plugin',
	START_TAG => '<@',
	END_TAG => '@>',
	WRAPPER => 'base.tt',
	ENCODING => 'utf-8',
	COMPILE_DIR => "/tmp/sycontent_template_cache_$<",
	STASH => Template::Stash::XS->new,
);

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );

1;
