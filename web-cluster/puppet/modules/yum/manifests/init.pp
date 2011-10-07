class yum {
  yumrepo {
    'epel':
      mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
      enabled => 1,
      gpgcheck => 1,
      gpgkey => 'http://keys.gnupg.net:11371/pks/lookup?search=0x217521F6&op=get';
  }
}
