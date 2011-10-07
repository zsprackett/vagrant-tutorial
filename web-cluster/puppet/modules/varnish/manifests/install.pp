class varnish::install {
  include yum
  package {
    'varnish':
      ensure => 'installed',
      require => Yumrepo['epel'];
  }
}
