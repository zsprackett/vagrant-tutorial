class varnish (
  $listen_port = 8082,
  $mgmt_port = 2000,
  $nfiles = 131072,
  $memlock = 82000,
  $backend_host = '127.0.0.1',
  $backend_port = 80
) {
  include varnish::install, varnish::service
  class { 'varnish::config':
    listen_port  => $listen_port,
    mgmt_port    => $mgmt_port,
    nfiles       => $nfiles,
    memlock      => $memlock,
    backend_host => $backend_host,
    backend_port => $backend_port,
  }
}
