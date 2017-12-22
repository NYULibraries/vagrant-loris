# == Class: kubernetes::repo
#
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
#
# === Examples
#
#  class { 'kubernetes':
#  }
#
# === Authors
#
# Flannon Jackson <flannon@nyu.edu>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class kubernetes::repo {

  yumrepo { 'virt7-docker-common-release':
    ensure          => present,
    descr           => 'virt7-docker-common-release',
    baseurl         => 'http://cbs.centos.org/repos/virt7-docker-common-release/x86_64/os/',
    enabled         => 1,
    protect         => 0,
    gpgcheck        => 0,
    metadata_expire => '30',
  }
}
