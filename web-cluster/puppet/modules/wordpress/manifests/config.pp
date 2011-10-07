class wordpress::config {
  include common::data
  $db_name = $common::data::db_name
  $db_host = $common::data::db_host
  $db_pass = $common::data::db_pass
  $db_user = $common::data::db_user

  file {
    '/etc/wordpress/wp-config.php':
      owner => 'root',
      group => 'root',
      mode => '0644',
      content => template('wordpress/wp-config.php.erb'),
      require => Class['wordpress::install'],
      notify  => Class['apache::service']
  } 
}
