default['3cubes-wordpress']['server_port'] = '80'

default['3cubes-wordpress']['server_name'] = node['fqdn']
default['3cubes-wordpress']['server_aliases'] = [node['fqdn']]

default['3cubes-wordpress']['parent_dir'] = '/var/www'
default['3cubes-wordpress']['dir'] = "#{node['3cubes-wordpress']['parent_dir']}/wordpress"

default['3cubes-wordpress']['install']['user'] = 'www-data'
default['3cubes-wordpress']['install']['group'] = 'www-data'
default['3cubes-wordpress']['config_perms'] = 0644

default['3cubes-wordpress']['version'] = 'latest'
default['3cubes-wordpress']['url'] = "https://wordpress.org/wordpress-#{node['3cubes-wordpress']['version']}.tar.gz"

default['3cubes-wordpress']['db']['instance_name'] = "wordpress"
default['3cubes-wordpress']['db']['root_password'] = "passtest"
default['3cubes-wordpress']['db']['name'] = "wordpressdb"
default['3cubes-wordpress']['db']['user'] = "wordpressuser"
default['3cubes-wordpress']['db']['pass'] = "passtest"
default['3cubes-wordpress']['db']['prefix'] = 'wp_'
default['3cubes-wordpress']['db']['host'] = 'localhost'
default['3cubes-wordpress']['db']['port'] = '3306'
default['3cubes-wordpress']['db']['charset'] = 'utf8'
default['3cubes-wordpress']['db']['collate'] = ''
default['3cubes-wordpress']['languages']['lang'] = ''
default['3cubes-wordpress']['allow_multisite'] = false
default['3cubes-wordpress']['wp_config_options'] = {}