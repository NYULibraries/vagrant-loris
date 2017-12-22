# Class: tct::params
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
class tct::params {

  case $::osfamily {
    'RedHat' : {
      $backend     = "dlts-enm-tct-backend"
      $frontend    = "dlts-enm-tct-frontend"
      $install_dir = "/opt/tct"
      $user        = 'tct'
      $venv        = '/opt/tct/virtualenv'
      $secret_key  = 'some_long_random_string_of_letters_numbers_and_symbols'
      $basename     = 'tct.home.wfc'
      $baseurl     = "http://${basename}/"
      $www_dir     = '/var/www/html'
      $pub_src     = "${install_dir}/www"
      # production_settings.py
      $allowed_hosts = 'nyuapi.infoloom.nyc'
      $static_root = "${install_dir}/www/static"
      $media_root  = "/opt/tct/www/${basename}/media"
      $epubs_src_folder  = "${media_root}/epubs"
      $tct_db      = 'nyuotl_db'
      $db_host     = 'localhost'
      $db_password = 'cFHg*Liw45'
      $db_user     = 'tctdb'

    }
  }
}
