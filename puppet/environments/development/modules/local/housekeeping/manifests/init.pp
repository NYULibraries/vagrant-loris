class housekeeping (
    $user = 'vagrant'
) {

  ensure_packages([
    'alpine',
    'bzip2-devel',
    'bind-utils',
    'gdbm-devel',
    'gcc',
    'gcc-c++',
    'git',
    'libffi-devel',
    'libxslt-devel',
    'libyaml-devel',
    'lsof',
    'nfs-utils',
    'ncurses-devel',
    'make',
    'openssl-devel',
    'patch',
    'readline-devel',
    'sqlite-devel',
    'zlib-devel',
    'unzip',
    'zip',
    'zlib-devel',
  ])

  file { '/home/root':
    ensure => link,
    target => '/root',
  }

  file { '/root/.bashrc':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/housekeeping/rootbashrc',
  }

  file { '/root/.gemrc':
    ensure => file,
    owner  => 'root',
    group  => 'root',
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
