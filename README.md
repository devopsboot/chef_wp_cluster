3cubes-wordpress Cookbook
=========================
Chef cookbook installs/configures WP cluster.

Requirements
------------

#### packages
- `openssl` - cookbook provides tools for working with the Ruby OpenSSL library.
- `apt` - cookbook includes recipes to execute apt-get update to ensure the local APT package cache is up to date.
- `apache2` - cookbook provides a complete Debian/Ubuntu style Apache HTTPD configuration.
- `php` - cookbook installs and configures PHP 5.3 and the PEAR package management system.
- `tar` - cookbook installs tar and two resources for managing remote tar files.
- `mysql2_chef_gem` - a library cookbook that provides an LWRP for use in recipes. 
- `database` - the `database` and `database_user` resources for managing databases and database users in a RDBMS.

Attributes
----------

#### 3cubes-wordpress::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['3cubes-wordpress']['server_port']</tt></td>
    <td>String</td>
    <td>Port for apache virtualhost</td>
    <td><tt>'80'</tt></td>
  </tr>
  <tr>
    <td><tt>['3cubes-wordpress']['server_name']</tt></td>
    <td>String</td>
    <td>Servername of apache virtualhost</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['3cubes-wordpress']['server_aliases']</tt></td>
    <td>String</td>
    <td>Server alias of apache virtualhost</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['3cubes-wordpress']['parent_dir']</tt></td>
    <td>String</td>
    <td>Apache www directory</td>
    <td><tt>'/var/www'</tt></td>
  </tr>
  <tr>
    <td><tt>['3cubes-wordpress']['dir']</tt></td>
    <td>String</td>
    <td>Root directory of virtualhost</td>
    <td><tt>"#{node['3cubes-wordpress']['parent_dir']}/wordpress"</tt></td>
</table>
TODO: Add rest attributes

Usage
-----
#### 3cubes-wordpress::default
To install/configure wordpress application, apache and php modules
Just include `3cubes-wordpress` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[3cubes-wordpress]"
  ]
}
```

#### 3cubes-wordpress::database
To install/configure mysql database for wordpress
Just include `3cubes-wordpress` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[3cubes-wordpress::database]"
  ]
}
```


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Artem Kobrin
