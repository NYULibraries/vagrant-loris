# Class: tct::install::nginx
# ===========================
#
# Full description of class tct here.
#
#
# Examples
# --------
#
#
# Authors
# -------
#
# Flannon Jackson <flannon@nyu.edu>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class tct::install::nginx (
  String $allowed_hosts = lookup('tct::params::allowed_hosts', String 'first'),
  String $backend       = lookup('tct::params::backend', String 'first'),
  String $basname       = lookup('tct::params::basename', String 'first'),
  String $baseurl       = lookup('tct::params::baseurl', String 'first'),
  String $db_host       = lookup('tct::params::db_host', String 'first'),
  String $db_password   = lookup('tct::params::db_password', String 'first'),
  String $db_user       = lookup('tct::params::db_user', String 'first'),
  String $epubs_src_folder = lookup('tct::params::epubs_src_folder', String 'first'),
  String $frontend      = lookup('tct::params::frontend', String 'first'),
  String $install_dir   = lookup('tct::params::install_dir', String 'first'),
  String $media_root    = lookup('tct::params::media_root', String 'first'),
  String $secret_key    = lookup('tct::params::secret_key', String 'first'),
  String $static_root   = lookup('tct::params::static_root', String 'first'),
  String $tct_db        = lookup('tct::params::tct_db', String 'first'),
  String $user          = lookup('tct::params::user', String 'first'),
  String $venv          = lookup('tct::params::venv', String 'first'),
  String $www_dir       = lookup('tct::params::www_dir', String 'first'),
){

  include nginx
  nginx::resource::server { 'tct.home.wfc':
    www_root =>  '/var/www/html',
  }
    
  firewall { '100 allow apache access on 80' :
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }

}
