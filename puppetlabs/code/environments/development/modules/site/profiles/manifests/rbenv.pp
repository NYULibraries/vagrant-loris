class profiles::rbenv {

  #include housekeeping::rbenv
  class { 'rbenv': 
    require => Package['git'],
  }
  rbenv::plugin { [ 'rbenv/rbenv-vars', 'rbenv/ruby-build' ]: }
  #rbenv::build { '2.1.3': global      => false }
  #rbenv::build { '1.9.3-p551': global  => false }
  #rbenv::build { '2.2.2': global       => true }
  #rbenv::gem { 'puppet': ruby_version => '1.9.3-p551' }
  #rbenv::gem { 'r10k': ruby_version    => '1.9.3-p551' }
  #rbenv::gem { 'r10k': ruby_version    => '2.2.2' }
  #rbenv::gem { 'aws-sdk': ruby-version => '2.2.2' }
  #rbenv::gem { 'net': ruby-version => '2.2.2' }

  file { "/etc/profile.d/rvm.sh":
    ensure => absent,
    purge => true,
    force => true,
  }

}
