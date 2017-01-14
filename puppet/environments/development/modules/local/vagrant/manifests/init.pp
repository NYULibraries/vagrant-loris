# == Class: vagrant
#
# Full description of class vagrant here.
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class vagrant {

  file { '/vagrant' :
    ensure => link,
    target => "/vagrant-${hostname}",
  }

}
