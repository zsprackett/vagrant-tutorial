class yum-updatesd::disable {
  include yum-updatesd::install

  service {
    'yum-updatesd':
      ensure => stopped,
      hasrestart => true,
      enable => false,
      require => Class['yum-updatesd::install']
  }
}
