# == Class: remi_safe_repo
#
# Full description of class remi_safe_repo here.
#
# === Examples
#
#  class { 'remi_safe_repo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class remi_safe_repo {

  yumrepo { 'remi-safe' :
      descr      => 'remi-safe',
      baseurl    => 'http://rpms.remirepo.net/enterprise/6/safe/$basearch/',
      mirrorlist => 'http://rpms.remirepo.net/enterprise/6/safe/mirror',
      enabled    => '1',
      gpgcheck   => '1',
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',

  }



}
