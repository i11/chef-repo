#
# Cookbook Name:: profile-testgang
# Attributes:: default
#
# Copyright 2013, Ilja Bobkevic
#
# All rights reserved - Do Not Redistribute
#

#
# USER
#
default['profile-testgang']['user']['name'] = 'jenkins'
default['profile-testgang']['user']['home'] = "/home/#{node['profile-testgang']['user']['name']}"

#
# NAMING
#
default['profile-testgang']['domain'] = 'testgang.net'

default['profile-testgang']['app']['name'] = 'app'
default['profile-testgang']['app']['root'] = File.join(node['profile-testgang']['user']['home'], 'app')
default['profile-testgang']['app']['ssl_dir'] = File.join(node['profile-testgang']['user']['home'], 'ssl', 'app')

default['profile-testgang']['rip']['port'] = 8080
default['profile-testgang']['rip']['root'] =  File.join(node['profile-testgang']['user']['home'], 'rip')

default['profile-testgang']['front']['name'] = 'www'
default['profile-testgang']['front']['root'] = File.join(node['profile-testgang']['user']['home'], 'www')

#
# NGINX
#
default['profile-testgang']['nginx']['servers'] = [
  {
    'server_name' => "(#{node['profile-testgang']['front']['name']}\.)?#{node['profile-testgang']['domain']}",
    'listen'      => 80,
    'location'    => [
      {
        'path'       => '/',
        'root'       => node['profile-testgang']['front']['root']
      }
    ]
  },
  {
    'server_name' => "#{node['profile-testgang']['app']['name']}.#{node['profile-testgang']['domain']}",
    'listen'      => 80,
    'rewrite'     => '^ https://$server_name$request_uri? permanent'
  },
  {
    'server_name' => "#{node['profile-testgang']['app']['name']}.#{node['profile-testgang']['domain']}",
    'listen'      => 443,
    'ssl'         => 'on',
    'ssl_certificate'     => File.join(node['profile-testgang']['app']['ssl_dir'], 'cert.crt'),
    'ssl_certificate_key' => File.join(node['profile-testgang']['app']['ssl_dir'], 'key.crt'),
    'location'    => [
      {
        'path'             => '/rip/',
        'root'             => node['profile-testgang']['rip']['root'],
        'proxy_pass'       => "http://127.0.0.1:#{node['profile-testgang']['rip']['port']}/rip/",
        'proxy_redirect'   => 'off',
        'proxy_set_header' => [ 'Host $host', 'X-Forwarded-For $remote_addr', 'X-Real-IP $remote_addr' ]
      },
      {
        'path'       => '/',
        'root'       => node['profile-testgang']['app']['root']
      }
    ]
  }
]
