#
# Cookbook Name:: profile-testgang
# Attributes:: default
#
# Copyright 2013, Ilja Bobkevic
#
# All rights reserved - Do Not Redistribute
#

#default['profile-testgang']['tomcat']['context_path'] = 'backend'
#default['profile-testgang']['tomcat']['manager_path'] = 'manager'
default['profile-testgang']['nginx']['servers'] = [
  {
    'server_name' => node['fqdn'],
    'listen'     => 80, 
    'location'   => [
      {   
        'path'             => '/',
        'proxy_pass'       => "http://127.0.0.1:#{node['tomcat']['port']}/",
        'proxy_redirect'   => 'off',
        'proxy_set_header' => [ 'Host $host', 'X-Forwarded-For $remote_addr', 'X-Real-IP $remote_addr' ]
      }
    ]
  }
]
