class mysqld::service {
  service { 'mysqld':
    enable => true,
    ensure => running,
    hasstatus => true,
    require => [ Class['mysqld::install'], Class['mysqld::config'] ]
  }
}
