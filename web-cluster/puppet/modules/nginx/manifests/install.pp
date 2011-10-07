class nginx::install {
  include yum
  package {
    'nginx':
      ensure => 'installed',
      require => Yumrepo['epel'];
  }
}
