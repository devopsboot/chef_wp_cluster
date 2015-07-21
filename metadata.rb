name             '3cubes-wordpress'
maintainer       '3Cubesit, Inc'
maintainer_email 'info@3cubesit.com'
license          'All rights reserved'
description      'Installs/Configures Wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'openssl', '~> 4.2.0'
depends 'apt', '~> 2.7.0'
depends 'apache2', '~> 3.1.0'
depends 'php', '~> 1.6.1'
depends 'tar', '~> 0.7.0'
depends "mysql2_chef_gem", "~> 1.0.1"
depends "database", ">= 1.6.0"