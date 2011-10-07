include iptables::disable
include iscsid::disable
include yum-updatesd::disable
include common::data
include selinux
include mysqld

mysqld::config::mysqldb {
  $common::data::db_name:
    user => $common::data::db_user,
    password => $common::data::db_pass,
    host => '%'
}
