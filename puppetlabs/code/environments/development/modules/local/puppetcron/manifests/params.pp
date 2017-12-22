# == Class: puppetcron
#
# Full description of class puppetcron here.
#
# === Examples
#
#  class { 'puppetcron':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name flannon@nyu.edu
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
#
#class puppetcron::params(

function puppetcron::params(
  Hash                  $options, # We ignore both of the arguments, but
  Puppet::LookupContext $context, # the funciton still needs to accept them.  
) {
  $base_params = {
    'puppetcron::ensure'        => 'present',
    'puppetcron::environment'   => '',
    'puppetcron::minute'        => '1',
  }
}
