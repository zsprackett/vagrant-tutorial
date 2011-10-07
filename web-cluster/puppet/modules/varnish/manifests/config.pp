class varnish::config (
  $listen_port,
  $mgmt_port,
  $nfiles,
  $memlock,
  $backend_host,
  $backend_port
)  {

  file {
    '/etc/varnish/default.vcl':
      require => Class['varnish::install'],
      content => template('varnish/default.vcl.erb'),
      notify => Class['varnish::service'],
      mode => '0644',
      owner => 'root',
      group => 'root';
    '/etc/sysconfig/varnish':
      require => Class['varnish::install'],
      content => template('varnish/sysconfig.erb'),
      notify => Class['varnish::service'],
      mode => '0644',
      owner => 'root',
      group => 'root';
  }
}
