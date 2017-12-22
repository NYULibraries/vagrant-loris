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
class profiles::web_apache::ichabod {
  # put vhosts and applicaiton servers info here

  apache::vhost { 'default.local' :
    vhost_name => '*',
    port       => '80',
    docroot    => '/var/www/html',
  }

  class { 'apache::mod::passenger' :
    passenger_high_performance       => 'off',
    passenger_pool_idle_time         => '300',
    passenger_max_pool_size          => '6',
    passenger_max_request_queue_size => '100',
    passenger_max_requests           => '0',
  }

}
