#
class housekeeping::aws {

  file { '/root/.aws' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }
  file { '/root/.aws/config' :
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
  file_line { '.aws/config 1':
    path => '/root/.aws/config',
    line => '[defaul]',
  }
  file_line { '.aws/config 2':
    path => '/root/.aws/config',
    line => 'output = json',
  }
  file_line { '.aws/config 3':
    path => '/root/.aws/config',
    line => 'region = us-east-1',
  }

  file { '/root/.gitconfig':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
  file_line { '.gitconfig 1':
    path => '/root/.gitconfig',
    line => '[credentials]',
  }
  file_line { '.gitconfig 2':
    path => '/root/.gitconfig',
    line => '  helper = !aws codecommit credential-helper $@',
  }
  file_line { '.gitconfig 3':
    path => '/root/.gitconfig',
    line => '  UseHttpPath = true',
  }

  python::pip { 'awscli':
    ensure     => latest,
    pkgname    => 'awscli',
    virtualenv => 'system',
    owner      => 'root',
    timeout    => 1800,
    require    => Class['housekeeping::python'],
  }
  ensure_resource( 'package',['r10k'], {
    'provider' => 'gem',
    'require'  => Class['Housekeeping::Ruby'],
  })

}
