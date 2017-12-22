#
class housekeeping::r10k (
    $user = 'ec2-user'
) {

  #class { 'r10k' :
  #  sources    => {
  #    'development' => {
  #      'remote' => 'https://git-codecommit.us-east-1.amazonaws.com/v1/repos/PuppetControl',
  #      'prefix'  => true,
  #    }
  #  }
  #}

  file { '/var/cache/r10k' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/etc/puppetlabs/r10k' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/etc/puppetlabs/r10k/r10k.yaml' :
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/housekeeping/r10k.yaml',
  }

}
