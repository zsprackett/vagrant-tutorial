include iptables::disable
include iscsid::disable
include yum-updatesd::disable
include selinux
include nginx

nginx::config::cluster{'test':
  servers => [
    '33.33.33.50:8082',
  ]
}
nginx::config::vhost{
  'zacmini.local':
    cluster => 'test',
}
