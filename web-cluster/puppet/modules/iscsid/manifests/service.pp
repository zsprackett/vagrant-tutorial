class iscsid::service {
  service {
    'iscsid':
      ensure => running,
      hasrestart => true,
      enable => true,
      require => Class['iscsid::install']
  }
}
