# == Class: profiles::cloud_rdo_ain
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
class profiles::cloud_rdo_ain (
  #$fsid = hiera('img_iip:fsid'),
){

  include housekeeping

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  #user { "stack":
  #  ensure     => present,
  #  managehome => true,
  #  comment    =>  'Fat stacks',
  #}
  #
  #file { '/etc/sudoers.d/stack':
  #  ensure  => file,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0440',
  #  content => 'stack ALL=(ALL) NOPASSWD: ALL'
  #}

  include rdo_aio

}
