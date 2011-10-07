class wordpress::install {
  include yum

  package {
    'wordpress':
      ensure => installed,
      require => Yumrepo['epel']
  }
}
