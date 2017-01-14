# == Class: profile::apache_profile
#
# Full description of class profile here.
#
# === Authors
#
# Flannon flannon@nyu.edu
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class profiles::web_apache {

  class { 'apache' :
    #default_vhost => false,
    keepalive     => 'On',
  }

  class { 'apache::mod::fcgid' : }
  class { 'apache::mod::headers' : }
  class { 'apache::mod::info' : }
  class { 'apache::mod::php' : }
  class { 'apache::mod::ssl' : }
  class { 'apache::mod::status' : }
  class { 'apache::mod::xsendfile' : }

  firewall { '100 allow apache access on 80' :
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }

}
