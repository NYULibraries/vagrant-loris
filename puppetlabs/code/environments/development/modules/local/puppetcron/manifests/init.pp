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
class puppetcron (
  $ensure = lookup('puppetcron::ensure'),
  $environment = lookup('puppetcron::environment', String, 'unique'),
  $minute = lookup('puppetcron::minute', Integer, {'strategy' => 'first'}, 10 ),
) {

  # Make sure /usr/local/sbin exits
  file { '/usr/local/sbin':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Install puppetcron script to manage puppet runs
  file { '/usr/local/sbin/puppetrun.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    content => template('puppetcron/puppetrun.sh.erb'),
    notify => Cron['puppet-cron'],
    }

  file { '/usr/local/sbin/puppetrun' :
    ensure => link,
    target => '/usr/local/sbin/puppetrun.sh',
  }

  file { '/var/log/puppet' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Run puppet once every half hour
  cron { 'puppet-cron' :
    ensure  => $ensure,
    command => '/usr/local/sbin/puppetrun.sh >> /var/log/puppet/puppetcron.log 2>&1',
    user    => 'root',
    minute  => "$minute-59/30",
    require => File['/usr/local/sbin/puppetrun.sh'],
  }

}
