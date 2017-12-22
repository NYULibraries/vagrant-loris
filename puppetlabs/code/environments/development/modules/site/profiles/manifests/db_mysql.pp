class profiles::db_mysql {
  include housekeeping
  #include java

  class { '::mysql::server':
    root_password           => 'vagrant',
    remove_default_accounts => true,
    service_enabled         => true,
  }
  include mysql::client
  include mysql::bindings
  mysql::db { 'vagrant' :
    user     => 'vagrant',
    password => 'vagrant',
    dbname   => 'vagrant',
    host     => 'localhost',
    grant    => [ 'ALL' ],
  }
  firewall { '100 allow mysql port access':
      dport   => 3306,
      proto   => tcp,
      action  => accept,
  }
}
