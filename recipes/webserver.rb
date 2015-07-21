#
# Cookbook Name:: 3cubes-wordpress
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2"
include_recipe "apache2::mod_php5"

web_app "wordpress" do
    template "wordpress.conf.erb"
    docroot node['3cubes-wordpress']['dir']
    server_name node['3cubes-wordpress']['server_name']
    server_aliases node['3cubes-wordpress']['server_aliases']
    server_port node['3cubes-wordpress']['server_port']
    enable true
end