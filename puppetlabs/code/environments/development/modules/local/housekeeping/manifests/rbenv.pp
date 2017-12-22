class housekeeping::rbenv (
    $user = 'ec2-user'
) {

  file { '/home/root':
    ensure => link,
    target => '/root',
  }

  file { '/root/.bashrc':
    ensure => file,
    source => 'puppet:///modules/housekeeping/rootbashrc',
  }

  file { '/root/.gemrc':
    ensure => file,
    source => 'puppet:///modules/housekeeping/gemrc',
  }

  file { "/home/${user}/.bashrc":
    ensure => file,
    source => 'puppet:///modules/housekeeping/bashrc',
    owner  => "${$user}",
    group  => "${$user}",
  }

  file { "/home/${user}/.gemrc":
    ensure => file,
    source => 'puppet:///modules/housekeeping/gemrc',
    owner  => "${$user}",
    group  => "${$user}",
  }

}
