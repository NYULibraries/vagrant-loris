class profiles::build_rpmfactory {

  include rpmbuilder
  #include gbp_rpm
  #include java
  class { 'java':
    package => 'java-1.8.0-openjdk-devel',
  }
  #include pyenv
  #pyenv::install { ['vagrant','root']: }
  #pyenv::compile { 'compile 2.7.11 root' :
  #  user   => 'root',
  #  python => '2.7.11',
  #  global => true,
  #}
  #pyenv::compile { 'compile 2.7.11 vagrant' :
  #  user    => 'vagrant',
  #  python  => '2.7.11',
  #  global  => true,
  #}

  #file { '/vagrant/src/rpmbuild':
  #  ensure => directory,
  #  owner  => $::user,
  #  group  => $::user,
  #}

  #file { "/home/${user}/rpmbuild":
  #  ensure => link,
  #  target => '/vagrant/src/rpmbuild',
  #}
}

