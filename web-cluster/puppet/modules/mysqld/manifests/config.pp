class mysqld::config {
  define mysqldb( $user, $password, $host='localhost' ) {
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -e \"show databases;\" | grep ${name}",
      command => "/usr/bin/mysql -e \"CREATE DATABASE ${name}; GRANT ALL PRIVILEGES ON ${name}.* TO ${user}@'${host}' IDENTIFIED BY '${password}'; FLUSH PRIVILEGES;\"",
      require => [ Class['mysqld::install'], Class['mysqld::service'] ]
    }
  }
}
