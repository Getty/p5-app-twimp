use strict;
use warnings;
use Test::More;


use Catalyst::Test 'App::Twimp';
use App::Twimp::Controller::Twitch;

ok( request('/twitch')->is_success, 'Request should succeed' );
done_testing();
