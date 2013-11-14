#
# Cookbook Name:: et_hostname
# Recipe:: default
#
# Copyright 2013, EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

require 'socket'

t = template "/etc/hosts" do
  source "hosts.erb"
  owner "root"
  group "root"
  mode 0644
  backup false
  action :nothing
end
t.run_action(:create)

e = execute "Set current hostname" do
  command "hostname #{node['fqdn']}"
  only_if { Socket.gethostname != node['fqdn'] }
  action :nothing
end
e.run_action(:run)

ohai "reload_hostname" do
  plugin "hostname"
  only_if { Socket.gethostname != node['fqdn'] }
end

execute "Set permanent hostname" do
  command "sysctl kernel.hostname=#{node['fqdn']}"
end
