#
# Cookbook Name:: profile-testgang
# Recipe:: _user
#
# Copyright 2013, Ilja Bobkevic
#
# All rights reserved - Do Not Redistribute
#

user node[cookbook_name]['user']['name'] do
  supports :manage_home => true
  home node[cookbook_name]['user']['home']
  shell '/bin/bash'
end

ssh_path = File.join(node[cookbook_name]['user']['home'], '.ssh')
directory ssh_path do
  owner node[cookbook_name]['user']['name']
  mode 00755
end

cookbook_file File.join(ssh_path, 'authorized_keys') do
  source 'user/authorized_keys'
  owner node[cookbook_name]['user']['name']
  mode 00444
end
