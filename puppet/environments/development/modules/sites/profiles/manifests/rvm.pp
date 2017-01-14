#
class profiles::rvm {
  class { '::rvm': }
  rvm::system_user { 'root': ; }
  rvm_system_ruby { 'ruby-1.9.3-p551':
      ensure      => 'present',
      # for vagrant default_user has to be set to false, 
      # otherwise it needs to be true.
      # grumble, grumble, rvm
      default_use => false,
  }
  rvm_gem { 'bundler':
    ensure       => latest,
    name         => 'bundler',
    ruby_version => 'ruby-1.9.3-p551',
    require      => Rvm_system_ruby['ruby-1.9.3-p551'];
  }
  rvm_gem { 'r10k':
    ensure       => latest,
    name         => 'r10k',
    ruby_version => 'ruby-1.9.3-p551',
    require      => Rvm_system_ruby['ruby-1.9.3-p551'];
  }
  rvm_gem { 'rest-client':
    ensure       => '1.8.0',
    name         => 'rest-client',
    ruby_version => 'ruby-1.9.3-p551',
    require      => Rvm_system_ruby['ruby-1.9.3-p551'];
  }
}

