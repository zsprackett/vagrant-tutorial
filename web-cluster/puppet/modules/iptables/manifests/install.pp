class iptables::install {
  package {
    'iptables':
      ensure => installed;
  }
}
