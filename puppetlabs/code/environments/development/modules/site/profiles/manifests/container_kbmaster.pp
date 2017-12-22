# == Class: profiles::container_kbmaster
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
class profiles::container_kbmaster {


  include housekeeping
  #include dltsyumrepo::development

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  include kubernetes::repo
  include kubernetes::install::master

}
