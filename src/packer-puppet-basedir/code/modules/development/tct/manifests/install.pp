# Class: tct::install
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
class tct::install (
  $backend       = $tct::params::backend,
  $frontend      = $tct::params::frontend,
  $install_dir   = $tct::params::install_dir,
  $user          = $tct::params::user,
  $venv          = $tct::params::venv,
  $secret_key    = $tct::params::secret_key,
  $basname       = $tct::params::basename,
  $baseurl       = $tct::params::baseurl,
  $www_dir       = $tct::params::www_dir,
  $allowed_hosts = $tct::params::allowed_hosts,
  $static_root   = $tct::params::static_root,
  $media_root    = $tct::params::media_root,
  $epubs_src_folder = $tct::params::epubs_src_folder,
  $tct_db        = $tct::params::tct_db,
  $db_host       = $tct::params::db_host,
  $db_password   = $tct::params::db_password,
  $db_user       = $tct::params::db_user,
) inherits tct::params {

  # Add the user
  user { $user :
    ensure     => present,
    name       => $user,
    comment    => "Topic Curation Toolkit",
    home       => $install_dir,
    managehome => false,
  }

  file { $install_dir:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  # Install the repos
  vcsrepo { "${install_dir}/${backend}":
    ensure   => present,
    provider => git,
    source   => "https://github.com/NYULibraries/${backend}",
    revision => $revision,
  }
  #vcsrepo { "${install_dir}/${frontend}":
  #  ensure   => present,
  #  provider => git,
  #  source   => "https://github.com/NYULibraries/${frontend}",
  #  revision => $revision,
  #}

  # Setup python
  ensure_packages(['python34', 'python34-devel', 'python34-pip'], {'ensure' => 'present'})
  #ensure_packages(['centos-release-scl', 'python33'], 
  #                {'ensure'              => 'present'})

  class { 'python':
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
    use_epel   => true,
  }->
  python::pip { 'pip':
    ensure     => latest,
    pkgname    => 'pip',
    virtualenv => 'system',
    owner      => 'root',
    timeout    => 1800,
  }->
  python::pip { 'virtualenv':
    ensure     => latest,
    pkgname     => 'virtualenv',
    virtualenv => 'system',
    owner      => 'root',
    timeout    => 1800,
  }->
  python::pip { 'setuptools':
    ensure     => latest,
    pkgname    => 'setuptools',
    virtualenv => 'system',
    owner      => 'root',
    timeout    => 1800,
  }
  python::virtualenv { $venv :
    ensure     => present,
    version    => '3',
    systempkgs => true,
    venv_dir   => $venv,
    owner      => 'root',
    group      => 'root',
    timeout    => 0,
    require => [ Class['python'], Package['python34'] ],
  }
  python::pip { 'psycopg2':
    ensure     => '2.7.1',
    pkgname    => 'psycopg2',
    virtualenv => $venv,
    owner      => 'root',
    timeout    => 1800,
    require    => Class['postgresql::server'],
  }
  python::pip { 'uwsgi':
    ensure     => latest,
    pkgname    => 'uwsgi',
    virtualenv => $venv,
    owner      => 'root',
    timeout    =>  1800,
  }
  file { "requirements.txt" :
    #path   => "/home/${user}/src/requirements.txt",
    ensure => present,
    path   => "${venv}/requirements.txt",
    owner  => 'root',
    group  => 'root',
    mode   => "0644",
    source => "puppet:///modules/tct/requirements.txt",
  }
  python::requirements { "${venv}/requirements.txt":
    virtualenv => $venv,
    owner      => 'root',
    group      => 'root',
    require    => Python::Virtualenv["${venv}"],
  }
  file { 'requirements-documentation.txt':
    ensure => present,
    path   => "${venv}/requirements-documentaiton.txt",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/tct/requirements-documentation.txt",
  }
  python::requirements { "${venv}/requirements-documentation.txt":
    virtualenv => $venv,
    owner      => 'root',
    group      => 'root',
    require    => Python::Virtualenv["${venv}"],
  }
  file { "requirements-testing.txt" :
    ensure => present,
    path   => "${venv}/requirements-testing.txt",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/tct/requirements-testing.txt",
  }
}
