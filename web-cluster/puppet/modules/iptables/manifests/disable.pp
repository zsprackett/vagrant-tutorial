class iptables::disable {
  include iptables::install

  service {
    'iptables':
      ensure => stopped,
      hasrestart => true,
      enable => false,
      require => Class['iptables::install']
  }
}
