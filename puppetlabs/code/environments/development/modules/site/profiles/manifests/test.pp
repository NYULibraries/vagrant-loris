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
class profiles::test {

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
  class { 'python':
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
    use_epel   => true,
  }
  #  Make sure pip is latest.
  python::pip { 'pip':
    ensure     => latest,
    pkgname    => 'pip',
    virtualenv => 'system',
    owner      => $::id,
    timeout    => 1800,
  }

  include pyenv
  pyenv::install { ['centos','root']: }

}
