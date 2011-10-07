class selinux::config {
  file {
    '/etc/sysconfig/selinux':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/selinux/sysconfig',
      require => Class['selinux::install'];
  }

  exec {
    'disable-selinux':
      unless => '/bin/grep ^0 /selinux/enforce',
      command => '/usr/sbin/setenforce 0',
      require => Class['selinux::install']
  }
}
