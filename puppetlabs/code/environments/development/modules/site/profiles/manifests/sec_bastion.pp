class profiles::sec_bastion {

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  #resources { 'firewall':
  #    purge => true,
  #}
  Firewall {
    before => Class['fw::post'],
    require => Class['fw::pre'],
  }
    # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }
  include puppetcron

  class { ['fw::pre', 'fw::post']: }
  class { 'firewall': }
  firewall {'001 allow inbound ssh':
    dport => 22,
    proto => tcp,
    action => accept,
    provider => 'iptables',
  }

  class { 'accounts':
    ssh_keys   => hiera_hash('accounts::ssh_keys', {}),
    users      => hiera_hash('accounts::users', {}),
    usergroups => hiera_hash('accounts::usergroups', {}),
    require    => Class['hiera'],
  }
  accounts::account { 'flannon' : }

  include epel
  user { 'puppet' :
    ensure => present,
  }
  include ::gnupg
  class { 'hiera':
    hierarchy => [
      '%{environment}/%{calling_class}',
      '%{environment}',
      'accounts',
      'common',
    ],
    require   => User['puppet'],
  }
  include housekeeping::bastion
  class { 'localtime':
      zone => 'America/New_York',
  }
  logrotate::rule { 'messages':
      path         => '/var/log/messages',
      rotate       => 5,
      rotate_every => 'week',
      postrotate   => '/usr/bin/killall -HUP syslogd'
  }
  include motd
  class { '::ntp':
      servers  => [ '0.amazon.pool.ntp.org', '1.amazon.pool.ntp.org', '2.amazon.pool.ntp.org', '3.amazon.pool.ntp.org' ],
  }
  include stdlib
  class { selinux:
    mode => 'enforcing',
    type => 'targeted',
  }

  #class { 'yum_autoupdate':
  #    #notify_email => false,
  #    email_to     => 'flannon@nyu.edu',
  #    email_from   => "yum@${hostname}",
  #}
  #include yumutils
  #class { 'yum_cron':
  #  apply_updates => true,
  #}
  service { 'crond':
    ensure => stopped,
    enable => false,
  }
  service { 'nfs-client':
    ensure => stopped,
    enable => false,
  }
  service { 'postfix' :
    ensure => stopped,
    enable => false,
  }


}
