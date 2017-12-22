#
class profiles::db_mysql::ichabod {
  #mysql::db { 'ichabod_db' :
  #  user     => 'ichabod',
  #  password => 'letmein',
  #  dbname   => 'ichabod_db',
  #  host     => 'localhost',
  #  grant    => [ 'ALL' ],
  #  charset  => 'utf8',
  #}
  mysql::db { 'fedora3' :
    user     => 'ichabod',
    password => 'letmein',
    dbname   => 'fedora3',
    host     => 'localhost',
    grant    => [ 'ALL' ],
    charset  => 'utf8',
  }
}
