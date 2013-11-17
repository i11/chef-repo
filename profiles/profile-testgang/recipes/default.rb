#
# Cookbook Name:: profile-testgang
# Recipe:: default
#
# Copyright 2013, Ilja Bobkevic
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{cookbook_name}::_nginx"
include_recipe "#{cookbook_name}::_user"
