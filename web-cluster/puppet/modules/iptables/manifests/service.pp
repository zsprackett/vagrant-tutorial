class iptables::service {
  service {
    'iptables':
      ensure => running,
      hasrestart => true,
      enable => true,
      require => Class['iptables::install']
  }
}
