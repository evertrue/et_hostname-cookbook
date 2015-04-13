# CHANGELOG for hostname

This file is used to list changes made in each version of hostname.

## 1.1.0:

* Remove Jeff's personal email address from the metadata and documentation
* Set up Test Kitchen and add some serverspec tests
* Handle nil addl_hosts_entries attribute value

## 1.0.4:

* Stop resetting the addl_hosts_entries array to `[]` (it renders the whole functionality useless)

## 1.0.3:

* Add support for supplemental hosts entries
* set target_domain and target_fqdn as defaults instead of node.set

## 1.0.2:

* Maintain /etc/hostname file
* Refactor /etc/hosts template

## 1.0.1:

* Total refactor
* hard-connect node FQDN to node.name
* hard-code node domain to "priv.evertrue.com"

## 0.1.0:

* Initial release of hostname
