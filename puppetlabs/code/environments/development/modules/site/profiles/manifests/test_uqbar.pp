# == Class: profiles::img_loris
#
# Full description of class profile here.
#
#
# === Authors
#
# Flannon Jackson <flannon@nyu.edu>
#
# === Copyright
#
# Copyright 2016 Your NYULibraries, unless otherwise noted.
#
class profiles::test_uqbar (
  #$fsid = hiera('img_iip:fsid'),
){

  include housekeeping

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }

  include maven

  #package { 'centos-release-scl':
  #  ensure => installed,
  #}
  #class { 'python':
  #  version    => 'system',
  #  pip        => 'present',
  #  dev        => 'present',
  #  virtualenv => 'present',
  #  gunicorn   => 'absent',
  #  use_epel   => true,
  #}
  #  Make sure pip is latest.
  #python::pip { 'pip':
  #  ensure     => latest,
  #  pkgname    => 'pip',
  #  virtualenv => 'system',
  #  owner      => $::id,
  #  timeout    => 1800,
  #}
  #python::virtualenv { 'uq venv' :
  #  ensure     => present,
  #  version    => 'system',
  #  systempkgs => true,
  #  venv_dir   => '/usr/local/virtualenv',
  #  owner      => $::id,
  #  group      => $::id,
  #  cwd        => '/tmp/vtmp',
  #  timeout    => 0,
  #  require    => Class['python'],
  #}
  #python::pip { 'uq boto3':
  #  ensure     => present,
  #  pkgname    => 'boto3',
  #  virtualenv => '/usr/local/virtualenv',
  #  owner      => $::id,
  #  timeout    => 1800,
  #  require    => Python::Virtualenv['uq venv'],
  #}

  #include pyenv
  #pyenv::install { ['centos']: }
  #pyenv::compile { 'compile 2.7.11 centos' :
  #  user   => 'centos',
  #  python => '2.7.11',
  #  global => true,
  #}
  #file_line { 'centos PYENV_ROOT':
  #  path => '/home/centos/.bashrc',
  #  line => 'export PYENV_ROOT="$HOME/.pyenv"',
  #}
  #file_line { 'centos PYENV_PATH':
  #  path => '/home/centos/.bashrc',
  #  line => 'export PATH="$PYENV_ROOT/bin:$PATH"',
  #}

  # daenney puppet-pyenv
  include pyenv
  #pyenv_python { '2.7.13': }
  #pyenv_python { '3.6.0': }


}
