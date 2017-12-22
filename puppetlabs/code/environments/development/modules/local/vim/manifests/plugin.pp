# define vim::plugin
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
#define vim::setup(
#  String $home = lookup('vim::home'),
#  String $vim_user = '$title',
#  String $vimrc = "$home/${title}/.vimrc"
#){

define vim::plugin (

  #String $home = lookup('vim::home'),
  #String $home = lookup('vim::home', String, 'first'),
  String $home = lookup('vim::home'),
  String $plugin = $title,
  String $group = lookup('vim::group'),
  String $user = lookup('vim::user'),
  String $home_dir = "$home/${user}",
){

  notice("From the defined type: $title")
  notice("From the defined type: $group")

  file_line { "$title" :
    ensure => present,
    path   => "${home_dir}/.vimrc",
    line   => "Plugin \'${title}\'",
    after  => "^Plugin \'gmarik/Vundle.vim\'"
  }
}
