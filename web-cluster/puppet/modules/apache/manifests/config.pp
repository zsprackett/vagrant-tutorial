class apache::config (
  $listen_ports
) {
  include common::data
  $internal_network = $common::data::internal_network

  if ! $common::data::internal_network {
    fail("The variable 'common::data::internal_network' must be set")
  }
  file {
    '/etc/httpd/conf/httpd.conf':
      owner => 'root',
      group => 'root',
      mode => '0644',
      alias => 'httpd.conf',
      content => template('apache/httpd.conf.erb'),
      require => Class['apache::install'],
      notify => Class['apache::service'];
    '/etc/httpd/vhosts.d/':
      ensure => 'directory',
      owner => 'root',
      group => 'root',
      mode => '0755',
      require => Class['apache::install'];
    '/etc/httpd/modules.d/':
      ensure => 'directory',
      owner => 'root',
      group => 'root',
      mode => '0755',
      require => Class['apache::install'];
  }

  define module($ensure = present, $modpath=undef, $rpm = undef, $rpmversion = undef) {
    if ($modpath) {
      $mp = $modpath
    } else {
      $mp = "modules/mod_${name}.so"
    }

    file {
      "/etc/httpd/modules.d/${name}.conf":
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template('apache/module.conf.erb'),
        require => [ File['httpd.conf'], Class['apache::install'] ],
        ensure => $ensure ? { present => present, default => absent },
        notify => Class['apache::service'];
    }

    if ($rpm) {
      $rpmv = $rpmversion ? { default => "installed" }
      if ($ensure == present) {
        package{
          "${rpm}":
          ensure => "${rpmv}";
        }
      } else {
        package{
          "${rpm}":
          ensure => absent;
        }
      }
    }
  }

  define vhost($ensure = present) {
    file {
      "/etc/httpd/vhosts.d/${name}.conf":
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template('apache/vhost.conf.erb'),
        require => [ File['httpd.conf'], Class['apache::install'] ],
        ensure => $ensure ? { present => present, default => absent },
        notify => Class['apache::service'];
      "/var/www/${name}":
        owner => 'root',
        group => 'apache',
        mode => '0755',
        ensure => $ensure ? { present => "directory", default => absent },
        require => Class['apache::install'];
    }
  }
}
