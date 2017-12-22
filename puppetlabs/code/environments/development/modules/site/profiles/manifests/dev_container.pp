# == Class: profiles::img_loris
#
# Full description of class profile here.
#
#
# === Authors
#
# Flannon Jackson <flannon@nyu.edu>
#
# === Copyright
#
# Copyright 2016 Your NYULibraries, unless otherwise noted.
#
class profiles::dev_container {

  alert ('This is from the development module directory')
  
  include housekeeping

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  include vim
  vim::setup{ "vagrant" :}
  vim::plugin{ 'flazz/vim-colorschemes' : }
    #  user  => 'vagrant',
    #group => 'vagrant',
    #}

  vim::plugin{ 'gmarik/Vundle.vim': }
  vim::plugin{ 'tpope/vim-fugitive': }
  vim::plugin{ 'Yggdroot/indentLine': }
  vim::plugin{ 'davidhalter/jedi-vim': }
  vim::plugin{ 'fatih/vim-go': }
  vim::plugin{ 'hashivim/vim-packer': }
  vim::plugin{ 'rodjek/vim-puppet': }
  vim::plugin{ 'hashivim/vim-terraform': }
  vim::plugin{ 'hashivim/vim-vagrant': }
  vim::plugin{ 'Valloric/YouCompleteMe': }
  vim::plugin{ 'L9': }

  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }

  include maven

  class { 'python':
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
    use_epel   => true,
  }
  #  Make sure pip is latest.
  python::pip { 'pip':
    ensure     => latest,
    pkgname    => 'pip',
    virtualenv => 'system',
    owner      => $::id,
    timeout    => 1800,
  }

  include pyenv
  #pyenv::install { ['centos','root']: }

  #if $facts['virtual'] == 'virtualbox' {
  #  warning('Virtualization is vbox')
  #  $users = ['root', 'vagrant']
  #}
  
  #warning("users - $users")
  #$users.each |String $users| {
  #  alert("users - $users")
  #  if $users == 'root' {
  #    alert("users should be root - $users")
  #    $userhome = "/${users}"
  #    alert("users should be /root - $userhome")
  #    housekeeping::goenv{ $userhome :}
  #  }
  #  else {
  #    $userhome = "/home/$users"
  #    warning("userhome - $userhome")
  #    #housekeeping::goenv{ $userhome : }
  #  }
  #}

  include dltsyumrepo::el7::test
  #include dltsyumrepo::test
  #include dltsyumrepo::development
  include golang


  $statements = ['this', 'is', 'the', 'last']
  #file { "/tmp/$statements" :
  #  ensure => present,
  #  #notice ("statemnet - $statments")
  #}
  $statements.each |String $statements| {
    warning("statement - $statements")
  }

}
