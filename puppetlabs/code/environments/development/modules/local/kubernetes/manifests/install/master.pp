# == Class: kubernetes::install::master
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
#  class { 'kubernetes::install::master':
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
class kubernetes::install::master(
  $single = $kubernetes::params::single,
) inherits kubernetes::params {

  package { 'kubernetes' :
    ensure => installed,
  }

  ensure_packages([ 'etcd', 'flannel',], 
  { 'ensure' =>  'present'})



}
