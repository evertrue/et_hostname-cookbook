set['target_domain'] = "priv.evertrue.com"
set['target_fqdn'] = "#{node.name}.#{node['target_domain']}"
override['domain'] = node['target_domain']
