# == Class: profile
#
# Full description of class profile here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'profile':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class profiles::rpmfactory {

  include rpmbuilder
  include gbp_rpm
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

  include golang

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

}
