class profiles::db_mysql {
  firewall { '100 allow http and https access':
      dport   => 3306,
      proto   => tcp,
      action  => accept,
  }
  include housekeeping
  #include java

  class { '::mysql::server':
    root_password           => 'vagrant',
    remove_default_accounts => true,
    override_options        => $override_options,
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
}
