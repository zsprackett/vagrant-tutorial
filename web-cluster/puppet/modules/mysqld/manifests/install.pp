class mysqld::install {
  package {
    'mysql-server':
      ensure => installed
  }
}
