use strict;
use warnings;
use Test::More;


use Catalyst::Test 'App::Twimp';
use App::Twimp::Controller::Feed;

ok( request('/feed')->is_success, 'Request should succeed' );
done_testing();
