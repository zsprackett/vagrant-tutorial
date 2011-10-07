class mysqld {
  include mysqld::install, mysqld::config, mysqld::service
}
