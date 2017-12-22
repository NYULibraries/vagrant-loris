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
  $backend       = $tct::params::backend,
  $frontend      = $tct::params::frontend,
  $install_dir   = $tct::params::install_dir,
  $user          = $tct::params::user,
  $venv          = $tct::params::venv,
  $secret_key    = $tct::params::secret_key,
  $basname       = $tct::params::basename,
  $baseurl       = $tct::params::baseurl,
  $www_dir       = $tct::params::www_dir,
  $pub_src       = $tct::params::pub_src,
  $allowed_hosts = $tct::params::allowed_hosts,
  $static_root   = $tct::params::static_root,
  $media_root    = $tct::params::media_root,
  $epubs_src_folder = $tct::params::epubs_src_folder,
  $tct_db        = $tct::params::tct_db,
  $db_host       = $tct::params::db_host,
  $db_password   = $tct::params::db_password,
  $db_user       = $tct::params::db_user,
) inherits tct::params {

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
  file { $pub_src:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file { "${pub_src}/${basename}":
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
