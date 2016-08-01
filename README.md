hostname Cookbook
=================
Sets the hostname to match the nodename set during creation/bootstrap. Also sets up a `/etc/hosts` with each node's hostname in it. Lifted almost wholesale from https://gist.github.com/rcreasey/904564.


Requirements
------------
Have to set the nodename during the server creation.


Usage
-----
Just include `hostname` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[et_hostname]"
  ]
}
```

It is also recommended that you set the `node['target_domain']` and `node['target_fqdn']` attributes to a domain other than `priv.evertrue.com`.

License and Authors
-------------------
Authors: Ryan C. Creasey <rcreasey@blizzard.com>  
         Jeff Byrnes <jeff@evertrue.com>  
License: None
