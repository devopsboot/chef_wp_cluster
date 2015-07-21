#
# Cookbook Name:: 3cubes-wordpress
# Recipe:: app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['3cubes-wordpress']['keys']['auth'] = secure_password
node.set_unless['3cubes-wordpress']['keys']['secure_auth'] = secure_password
node.set_unless['3cubes-wordpress']['keys']['logged_in'] = secure_password
node.set_unless['3cubes-wordpress']['keys']['nonce'] = secure_password
node.set_unless['3cubes-wordpress']['salt']['auth'] = secure_password
node.set_unless['3cubes-wordpress']['salt']['secure_auth'] = secure_password
node.set_unless['3cubes-wordpress']['salt']['logged_in'] = secure_password
node.set_unless['3cubes-wordpress']['salt']['nonce'] = secure_password
node.save unless Chef::Config[:solo]

directory node['3cubes-wordpress']['dir'] do
  action :create
  recursive true
  owner node['3cubes-wordpress']['install']['user']
  group node['3cubes-wordpress']['install']['group']
  mode  '0755'
end

tar_extract node['3cubes-wordpress']['url'] do
  target_dir node['3cubes-wordpress']['dir']
  creates File.join(node['3cubes-wordpress']['dir'], 'index.php')
  user node['3cubes-wordpress']['install']['user']
  group node['3cubes-wordpress']['install']['group']
  tar_flags [ '--strip-components 1' ]
  not_if { ::File.exists?("#{node['3cubes-wordpress']['dir']}/index.php") }
end

# Get Public IP of mysql
if node['3cubes-wordpress']['db']['host'] == 'localhost'
  db_host = 'localhost'
else
  db_server = search(:node, "name:#{node['3cubes-wordpress']['db']['host']}")
  db_host = "#{db_server[0][:ec2][:public_ipv4]}"
end


template "#{node['3cubes-wordpress']['dir']}/wp-config.php" do
  source 'wp-config.php.erb'
  mode node['3cubes-wordpress']['config_perms']
  variables(
    :db_name           => node['3cubes-wordpress']['db']['name'],
    :db_user           => node['3cubes-wordpress']['db']['user'],
    :db_password       => node['3cubes-wordpress']['db']['pass'],
    :db_host           => db_host,
    :db_prefix         => node['3cubes-wordpress']['db']['prefix'],
    :db_charset        => node['3cubes-wordpress']['db']['charset'],
    :db_collate        => node['3cubes-wordpress']['db']['collate'],
    :auth_key          => node['3cubes-wordpress']['keys']['auth'],
    :secure_auth_key   => node['3cubes-wordpress']['keys']['secure_auth'],
    :logged_in_key     => node['3cubes-wordpress']['keys']['logged_in'],
    :nonce_key         => node['3cubes-wordpress']['keys']['nonce'],
    :auth_salt         => node['3cubes-wordpress']['salt']['auth'],
    :secure_auth_salt  => node['3cubes-wordpress']['salt']['secure_auth'],
    :logged_in_salt    => node['3cubes-wordpress']['salt']['logged_in'],
    :nonce_salt        => node['3cubes-wordpress']['salt']['nonce'],
    :lang              => node['3cubes-wordpress']['languages']['lang'],
    :allow_multisite   => node['3cubes-wordpress']['allow_multisite'],
    :wp_config_options => node['3cubes-wordpress']['wp_config_options']
  )
  owner node['3cubes-wordpress']['install']['user']
  group node['3cubes-wordpress']['install']['group']
  action :create
end