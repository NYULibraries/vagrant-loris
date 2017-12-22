# == Class: profile::cms_tct
#
# Full description of class profile here.
#
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#


class profiles::webapp_tct(
  $www_dir = '/var/www',
) {

  include housekeeping
  include dltsyumrepo::development

  group {'dlib' :
    ensure => present,
    gid    => '200',
  }

  include tct


}
