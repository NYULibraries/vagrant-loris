class housekeeping::rvm (
    $user = 'ec2-user'
) {

  file { '/etc/profile.d/rvm.sh':
    ensure => file,
    source => 'puppet:///modules/housekeeping/rvm.sh',
    group => 'root',
    owner => 'root',
    mode => 0775,
  }

}
