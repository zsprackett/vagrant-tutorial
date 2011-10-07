class yum-updatesd::service {
  service {
    'yum-updatesd':
      ensure => running,
      hasrestart => true,
      enable => true,
      require => Class['yum-updatesd::install']
  }
}
