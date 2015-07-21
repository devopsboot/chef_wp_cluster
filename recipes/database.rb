#
# Cookbook Name:: 3cubes-wordpress
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end


db = node['3cubes-wordpress']['db']

mysql_service db['instance_name'] do
  port db['port']
  version db['mysql_version']
  initial_root_password db['root_password']
  action [:create, :start]
end

link '/var/run/mysqld/mysqld.sock' do
  to "/var/run/mysql-#{db['instance_name']}/mysqld.sock"
  not_if 'test -f /var/run/mysqld/mysqld.sock'
end

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :socket   => "/var/run/mysql-#{db['instance_name']}/mysqld.sock",
  :password => db['root_password']
}

mysql_database db['name'] do
  connection  mysql_connection_info
  action      :create
end

mysql_database_user db['user'] do
  connection    mysql_connection_info
  password      db['pass']
  host          "%"
  database_name db['name']
  action        :create
end

mysql_database_user db['user'] do
  connection    mysql_connection_info
  database_name "%"
  privileges    [:all]
  action        :grant
end
