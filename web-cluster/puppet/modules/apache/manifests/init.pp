class apache (
  $listen_ports = 80
) {
  include apache::install, apache::service
  class { 'apache::config':
    listen_ports => $listen_ports
  }
}
