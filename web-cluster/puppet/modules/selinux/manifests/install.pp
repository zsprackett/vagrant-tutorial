class selinux::install {
  package {
    'selinux-policy':
      ensure => installed;
  }
}
