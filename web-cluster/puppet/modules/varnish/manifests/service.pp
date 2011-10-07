class varnish::service {
  service {
    'varnish':
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      enable => true,
      require => [ Class['varnish::install'], Class['varnish::config'] ]
  }
}
