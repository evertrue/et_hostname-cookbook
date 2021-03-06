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
  variables(addl_hosts_entries: node.fetch(:et_hostname, {})
                                    .fetch(:addl_hosts_entries, []))
end
t.run_action(:create)

file "/etc/hostname" do
  content node['target_fqdn'] + "\n"
  action :nothing
end.run_action(:create)

e = execute "Set current hostname precomp" do
  command "hostname #{node['target_fqdn']}"
  only_if { Socket.gethostname != node['target_fqdn'] }
  action :nothing
end
e.run_action(:run)

execute "Set current hostname" do
  command "hostname #{node['target_fqdn']}"
  only_if { Socket.gethostname != node['target_fqdn'] }
end

ohai "reload_hostname" do
  plugin "hostname"
end

execute "Set permanent hostname" do
  command "sysctl kernel.hostname=#{node['target_fqdn']}"
end
