class iscsid::disable {
  include iscsid::install

  service {
    'iscsid':
      ensure => stopped,
      hasrestart => true,
      enable => false,
      require => Class['iscsid::install']
  }
}
