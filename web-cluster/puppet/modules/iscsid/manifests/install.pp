class iscsid::install {
  package {
    'iscsi-initiator-utils':
      ensure => installed;
  }
}
