#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'App-Twimp';
all_from 'lib/App/Twimp.pm';

requires 'Catalyst::Runtime' => '5.80031';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'YAML';
requires 'Template::Provider::Encoding' => '0.10';
requires 'Catalyst::View::TT' => '0.35';
requires 'Catalyst::Plugin::Unicode::Encoding';
requires 'HTML::ExtractContent';
requires 'XML::Feed';
requires 'LWP';

install_share 'share';

test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
