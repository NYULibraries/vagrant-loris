# == Class: profiles::test_templates
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
class profiles::test_templates (
  #$fsid = hiera('img_iip:fsid'),
){

  include housekeeping

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }


}
