# Class: tct::install::frontend
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
class tct::install::frontend (
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


  #  include nginx
  #nginx::resource::server { 'tct.home.wfc':
  #  www_root =>  '/var/www/html',
  #}
  #  
  #firewall { '100 allow apache access on 80' :
  #  dport  => [80, 443],
  #  proto  => tcp,
  #  action => accept,
  #}

  #vcsrepo { "${install_dir}/${frontend}":
  vcsrepo { $www_dir:
    ensure   => present,
    provider => git,
    source   => "https://github.com/NYULibraries/${frontend}",
    revision => $revision,
  }
  # the file resource for bower.json is a total kludge
  # that needs to be fixed in the repo.
  file { 'bower.json':
    ensure  => file,
    path    => "${www_dir}/bower.json",
    replace => true,
    require => Vcsrepo["$www_dir"],
    source  => 'puppet:///modules/tct/bower.json',
  }
  file { 'settings.js':
    ensure  => file,
    path    => "${www_dir}/src/js/angular/settings.js",
    require => Vcsrepo["$www_dir"],
    content =>  template('tct/settings.js.erb'),
  }
  class { 'nodejs':
    repo_url_suffix            => '7.x',
    nodejs_package_name        => 'nodejs-2:7.7.4-1nodesource.el7.centos.x86_64'
  }
  package { 'bower':
    ensure   => '1.8.0',
    provider => 'npm',
  }
  package { 'gulp-cli':
    ensure   => present,
    provider => 'npm',
  }

  exec { 'exec_npm_install_bower' :
    path       => ['/opt/tct/virtualenv/bin','/bin','/usr/bin','/usr/local/bin'],
    cwd        => $www_dir,
    command    => '/usr/bin/npm install -g bower',
    #creates    => "${www_dir}/node_modules",
    require    => [ Class['nginx'], Vcsrepo["$www_dir"] ],
    user       => 'root',
  }
  exec { 'exec_npm_install' :
    path       => ['/opt/tct/virtualenv/bin','/bin','/usr/bin','/usr/local/bin'],
    cwd        => $www_dir,
    command    => '/usr/bin/npm install',
    creates    => "${www_dir}/node_modules",
    require    => [ Class['nginx'], Vcsrepo["$www_dir"], Exec['exec_npm_install_bower'] ],
    #tries     => '5',
    #try_sleep => '1',
    user       => 'root',
  }
  exec { 'exec_bower_install' :
    path       => ['/opt/tct/virtualenv/bin','/bin','/usr/bin','/usr/local/bin'],
    cwd        => $www_dir,
    command    => '/usr/bin/bower --allow-root install --config.interactive=false',
    creates    => "${www_dir}/bower_components",
    require    => [ Class['nginx'], Vcsrepo["$www_dir"], File['bower.json'] ],
    #tries     => '5',
    #try_sleep => '1',
    user       => 'root',
  }


}
