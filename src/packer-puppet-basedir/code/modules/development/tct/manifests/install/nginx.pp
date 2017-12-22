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
  $backend       = $tct::params::backend,
  $frontend      = $tct::params::frontend,
  $install_dir   = $tct::params::install_dir,
  $user          = $tct::params::user,
  $venv          = $tct::params::venv,
  $secret_key    = $tct::params::secret_key,
  $basname       = $tct::params::basename,
  $baseurl       = $tct::params::baseurl,
  $www_dir       = $tct::params::www_dir,
  $allowed_hosts = $tct::params::allowed_hosts,
  $static_root   = $tct::params::static_root,
  $media_root    = $tct::params::media_root,
  $epubs_src_folder = $tct::params::epubs_src_folder,
  $tct_db        = $tct::params::tct_db,
  $db_host       = $tct::params::db_host,
  $db_password   = $tct::params::db_password,
  $db_user       = $tct::params::db_user,
) inherits tct::params {

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
