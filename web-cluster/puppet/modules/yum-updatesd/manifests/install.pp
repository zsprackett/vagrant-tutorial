class yum-updatesd::install {
  package {
    'yum-updatesd':
      ensure => installed;
  }
}
