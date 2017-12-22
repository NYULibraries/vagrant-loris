#
class profiles::dev_aspace_devenv(
  String $install_dir = lookup('archivesspace_devenv::install_dir', String, 'first'),
  String $revision    = lookup('archivesspace_devenv::revision', String, 'first'),
  String $source      = lookup('archivesspace_devenv::source', String, 'first'),
  String $user        = lookup('archivesspace_devenv::user', String, 'first'),
  String $asdb_name   = lookup('archivesspace_devenv::asdb_name', String, 'first'),
  String $asdb_passwd = lookup('archivesspace_devenv::asdb_passwd', String, 'first'),
  String $asdb_user   = lookup('archivesspace_devenv::asdb_user', String, 'first'),
) {
  firewall { '100 archivesspace_devenv port access':
      dport   => [3000, 3100, 4567, 8080, 8081,  8089, 8090, 8091 ],
      proto   => tcp,
      action  => accept,
  }
  include housekeeping
  #include java
  class { 'java':
    package => 'java-1.8.0-openjdk-devel',
  }
  class { 'archivesspace_devenv' :
      install_dir => $install_dir,
      revision    => $revision,
      source      => $source,
      user        => $user,
  }
  include profiles::db_mysql
  mysql::db { 'asdb' :
    user     => $asdb_user,
    password => $asdb_passwd,
    dbname   => $asdb_name,
    host     => 'localhost',
    grant    => [ 'ALL' ],
  }

}
