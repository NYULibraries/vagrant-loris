# Class: tct::install::backend
# ===========================
#
# Full description of class tct here.
#
#
# Examples
# --------
#
#
# Authors
# -------
#
# Flannon Jackson <flannon@nyu.edu>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class tct::install::backend (
  String $allowed_hosts = lookup('tct::allowed_hosts', String, 'first'),
  String $backend       = lookup('tct::backend', String, 'first'),
  String $basename       = lookup('tct::basename', String, 'first'),
  String $baseurl       = lookup('tct::baseurl', String, 'first'),
  String $db_host       = lookup('tct::db_host', String, 'first'),
  String $db_password   = lookup('tct::db_password', String, 'first'),
  String $db_user       = lookup('tct::db_user', String, 'first'),
  String $epubs_src_folder = lookup('tct::epubs_src_folder', String, 'first'),
  String $frontend      = lookup('tct::frontend', String, 'first'),
  String $install_dir   = lookup('tct::install_dir', String, 'first'),
  String $pub_src       = lookup('tct::pub_src', String, 'first'),
  String $secret_key    = lookup('tct::secret_key', String, 'first'),
  String $static_root   = lookup('tct::static_root', String, 'first'),
  String $tct_db        = lookup('tct::tct_db', String, 'first'),
  String $user          = lookup('tct::user', String, 'first'),
  String $venv          = lookup('tct::venv', String, 'first'),
  String $www_dir       = lookup('tct::www_dir', String, 'first'),
  String $media_root    = lookup('tct::media_root', String, 'first'),
){

  # postgres
  include postgresql::server
  postgresql::server::db { $tct_db:
    user     => $db_user,
    password => postgresql_password($db_user, $db_password),
  }
  postgresql::server::role { 'tct_role':
    password_hash => postgresql_password('tct_role', '$db_password'),
  }
  postgresql::server::database_grant {$db_user:
    privilege => 'ALL',
    db        => $tct_db,
    role      => 'tct_role',
  }

  # Load backend database production_settings
  file { 'production_settings.py':
    ensure  => file,
    path    => "${install_dir}/${backend}/nyu/production_settings.py",
    require => Vcsrepo["${install_dir}/${backend}"],
    content => template('tct/production_settings.py.erb'),
  }
  file { 'secretkeys.json':
    ensure  => file,
    path    => "${install_dir}/${backend}/nyu/secretkeys.json",
    require => Vcsrepo["${install_dir}/${backend}"],
    content => template('tct/secret_keys.json.erb'),
  }
  file { '/var/log/django':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { "$pub_src":
  #file { "${install_dir}/www":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file { "$pub_src/$basename":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file { $media_root:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file { $epubs_src_folder:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }

  # Hold hour nose, do the exec thing, and run the python installer,
  #  python manage.py loaddata indexpatterns.json
  # see: dlts-enm-tct-backend/documentation/site/setup/index.html

  exec { 'exec_manage_py_migrate':
    path     => ['/opt/tct/virtualenv/bin','/bin','/usr/bin','/usr/local/b    in'],
    cwd      => "${install_dir}/${backend}",
    command  => 'python manage.py migrate',
    creates  => "${install_dir}/${backend}/reconciliation/__pycache__",
    require  => File['secretkeys.json'],
    user     => 'root',
  }


}
