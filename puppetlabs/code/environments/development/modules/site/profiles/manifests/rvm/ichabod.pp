#
class profiles::rvm::ichabod {
  #class { '::rvm': }
  #rvm::system_user { 'root': ; }
  rvm_system_ruby {
    'ruby-2.1.3':
      ensure      => 'present',
      # Set default_use in profile::rvm
      default_use => false,
  }
  rvm_gemset {
    'ruby-2.1.3@ichabod':
      ensure  => present,
      require => Rvm_system_ruby['ruby-2.1.3'];
  }
  rvm_gem { 'bundler for 2.1.3':
    ensure       => latest,
    name         => 'bundler',
    ruby_version => 'ruby-2.1.3',
    require      => Rvm_system_ruby['ruby-2.1.3'];
  }
  rvm_gem { 'r10k for 2.1.3':
    ensure       => latest,
    name         => 'r10k',
    ruby_version => 'ruby-2.1.3',
    require      => Rvm_system_ruby['ruby-2.1.3'];
  }
  rvm_gem { 'rest-client for 2.1.3':
    ensure       => '1.8.0',
    name         => 'rest-client',
    ruby_version => 'ruby-1.9.3-p551',
    require      => Rvm_system_ruby['ruby-2.1.3'];
  }
}

