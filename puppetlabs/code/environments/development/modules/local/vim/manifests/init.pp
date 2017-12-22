# Class: vim
# ===========================
#
# Full description of class vim here.
#
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class vim(
  String $home = lookup("vim::home"),
  String $plugin      = $title,
  String $group       = lookup("vim::group"),
  String $user        = lookup("vim::user"),
  String $home_dir    = "$home/${user}",
  String $test        = lookup("vim::test"),
  Array $requirements = lookup("vim::requirements", Array[String], 'first'),
  Array $packages     = lookup("vim::packages", Array[String], 'first'),
) {

  #alert ("The idenity user is: $user")
  #alert ("The home: $home")


  yumrepo { 'mcepl-vim8' :
    name             => 'mcepl-vim8',
    descr            => 'Copr repo for vim8 owned by mcepl',
    baseurl          => 'https://copr-be.cloud.fedoraproject.org/results/mcepl/vim8/epel-7-$basearch/',
    gpgcheck         => 1,
    gpgkey           => 'https://copr-be.cloud.fedoraproject.org/results/mcepl/vim8/pubkey.gpg',
    repo_gpgcheck    => 0,
    enabled          => 1,
  }

  ensure_packages([ $requirements ], {'ensure' => 'present',} )
  #ensure_packages([ $packages ], {'ensure' => 'latest',} )

  #package { 'vim-enhanced-2:8.0.0600-1.1.24.el7.centos.x86_64' :
  #  ensure =>  installed,



  file { "${home}/${user}/.README.vim" :
    ensure => file,
    owner  => $user,
    group  =>  $user,
    source => "puppet:///modules/vim/README.vim",
  }

}
