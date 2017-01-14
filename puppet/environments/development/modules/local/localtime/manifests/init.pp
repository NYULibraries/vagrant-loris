# == Class: localtime
#
# Full description of class localtime here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'localtime':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class localtime ( 
    $package_ensure = $localtime::params::package_ensure,
    $zone           = $localtime::params::zone,
    #$default_zone   = $localtime::params::default_zone,
) inherits localtime::params {
    anchor { 'localtime::begin': } ->
    class { '::localtime::install': } ->
    anchor { 'localtime::end': }

    file { '/etc/timezone':
        content => inline_template('<%= @zone + "\n" %>'),
    }

    case $::osfamily {
            'RedHat': {
                file { '/etc/localtime':
                    ensure => 'present',
                    #ensure => 'link',
                    target => "/usr/share/zoneinfo/${zone}",
                    require => Package[$package_name],
                }
            }
            default: {
                fail("The ${module_name} module is not supported on an ${::operatingsystem} distributions.")
            }
        }
}
