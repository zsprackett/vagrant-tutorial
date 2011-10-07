class index {
  file {
    '/var/www/html/index.html':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/index/index.html',
      require => Class['apache::install'];
  }
}
