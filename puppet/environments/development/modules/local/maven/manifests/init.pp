# == Class: epel_apache_maven
#
# Full description of class epel_apache_maven here.
#
# === Parameters
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class maven {

  include maven::repo
  include maven::install

  Class['maven::repo'] -> Class['maven::install']


}
