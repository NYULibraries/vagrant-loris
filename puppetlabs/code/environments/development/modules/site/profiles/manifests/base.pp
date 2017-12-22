class profiles::base {

    # Processes all yumrepo types  before any packages that
    # don't have 'rpm' as their provider.  Allows epel rpm package
    # to help install the package.
    #  from http://bit.ly/1xrYz1t

    Yumrepo <| |> -> Package <| provider != 'rpm' |>

    if $facts[os][release][major] == '6' {
      include dltsyumrepo::test
    }
    elsif $facts[os][release][major] == '7' {
      #include dltsyumrepo::el7::test
    }
    #resources { 'firewall':
    #    purge => true,
    #}
    Firewall {
      before => Class['fw::post'],
      require => Class['fw::pre'],
    }
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

    user { 'puppet' :
      ensure => present,
    }
    include ::gnupg
    #class { 'hiera':
    #  hierarchy => [
    #    '%{environment}/%{calling_class}',
    #    '%{environment}',
    #    'accounts',
    #    'common',
    #  ],
    #  require   => User['puppet'],
    #}
    class { 'hiera':
      hiera_version   => '5',
      hiera5_defaults => {'datadir' => 'data', 'data_hash' =>  'yaml_data'},
      hierarchy       => [
                          { 'name' => 'Per-node data (yaml version)', 'path' => 'nodes/%{trusted.certname}.yaml'},
                          { 'name' => 'Other yaml hierarchy levels', 'paths' => ['location/%{facts.whereami}/%{facts.group}.yaml', 'groups/%{facts.group}.yaml', 'os/%{facts.os.family}.yaml', 'accounts.yaml', 'common.yaml']},
                        ],
      require => User['puppet'],
    }
    include housekeeping
    class { 'localtime':
        zone => 'America/New_York',
    }
    logrotate::rule { 'messages':
        path         => '/var/log/messages',
        rotate       => 5,
        rotate_every => 'week',
        postrotate   => '/usr/bin/killall -HUP syslogd'
    }
    include manpages
    include motd
    class { '::ntp':
        servers  => [ 'tick.nyu.edu', 'tock.nyu.edu' ],
    }
    include stdlib
    include vim
    #class { 'yum_autoupdate':
    #    #notify_email => false,
    #    email_to     => 'flannon@nyu.edu',
    #    email_from   => "yum@${hostname}",
    #}
    #include yumutils
    #class { 'yum_cron':
    #  apply_updates => true,
    #}

}
