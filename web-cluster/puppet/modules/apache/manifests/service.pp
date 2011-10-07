class apache::service {
  service {
    'httpd':
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      enable => true,
      require => [ Class['apache::install'], Class['apache::config'] ]
  }
}
