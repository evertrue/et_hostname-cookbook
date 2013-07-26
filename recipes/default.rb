#
# Cookbook Name:: et_hostname
# Recipe:: default
#
# Copyright 2013, EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/hosts" do
  source "hosts.erb"
  owner "root"
  group "root"
  mode 0644
  backup false
end

execute "Set current hostname" do
  command "hostname #{node.name}"
end

execute "Set permanent hostname" do
  command "sysctl kernel.hostname=#{node.name}"
end
