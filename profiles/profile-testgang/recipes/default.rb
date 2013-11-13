#
# Cookbook Name:: profile-testgang
# Recipe:: default
#
# Copyright 2013, Ilja Bobkevic
#
# All rights reserved - Do Not Redistribute
#

site = 'testgang'

template File.join(node['nginx']['dir'], 'sites-available', site) do
  source 'web_app.conf.erb'
  owner  node['nginx']['user']
  group  node['nginx']['group']
  mode   00444
  variables({
    :servers => node[cookbook_name]['nginx']['servers']
  })
end

nginx_site site do
  notifies :reload, 'service[nginx]'
end
