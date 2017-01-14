class profiles::db_mysql:network {
  firewall { '100 allow mysql and https access':
      dport   => 3306,
      proto   => tcp,
      action  => accept,
  }
}
