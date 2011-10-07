include iptables::disable
include iscsid::disable
include yum-updatesd::disable
include selinux
include wordpress
include index
class { 'apache':
  listen_ports => ['80','8081']
}
class { 'varnish':
  backend_port => '8081'
}

apache::config::module{
  'proxy_module':
    modpath => 'modules/mod_proxy.so';
  'status_module':
    modpath => 'modules/mod_status.so';
  'authz_host_module':
    modpath => 'modules/mod_authz_host.so';
  'mime_module':
    modpath => 'modules/mod_mime.so';
  'dir_module':
    modpath => 'modules/mod_dir.so';
  'alias_module':
    modpath => 'modules/mod_alias.so';
  'autoindex_module':
    modpath => 'modules/mod_autoindex.so';
}
