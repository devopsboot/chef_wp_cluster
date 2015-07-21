#
# Cookbook Name:: 3cubes-wordpress
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt::default'
include_recipe '3cubes-wordpress::webserver'
include_recipe '3cubes-wordpress::app'


