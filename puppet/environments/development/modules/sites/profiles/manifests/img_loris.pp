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
class profiles::img_loris (
  #$fsid = hiera('img_iip:fsid'),
){

  include housekeeping
  include dltsyumrepo::development

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  include loris
  include loris::apache
  include loris::apache::vhost
  include loris::cache
  include loris::demo

  #Class['loris::apache']->Class['loris::apache::vhost']->Class['loris']

}
