# == Class: profile::webapp_archivesspace
#
# Full description of class profile here.
#
# === Authors
#
# Flannon flannon@nyu.edu
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class profiles::webapp_archivesspace (
  $install_dir = lookup('archivesspace::install_dir', String, 'first' ),
  $db_host     = lookup('archivesspace::db_host', String, 'first' ),
  $db_name     = lookup('archivesspace::db_name', String, 'first' ),
  $db_passwd   = lookup('archivesspace::db_passwd', String, 'first' ),
  $db_user     = lookup('archivesspace::db_user', String, 'first' ),
  $ensure             = lookup('archivesspace::ensure', String, 'first'),
  $plugin_install_dir = lookup('archivesspace::plugin_install_dir', String, 'first'),

  $plugin_ead_export_revision = lookup('archivesspace::plugin_ead_export_revision'), 
  $plugin_marcxml_export_revision = lookup('archivesspace::plugin_marcxml_export_revision'),
  $plugin_sso_revision = lookup('archivesspace::plugin_sso_revision'),
  $user                = lookup('archivesspace::user', String, 'first' ),
  $group               = lookup('archivesspace::group', String, 'first' ),
  #$region             = chop($ec2_placement_availability_zone),
) {

  #warning("this is the region: ${region}")

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }
  #accounts::account { 'esha' : }
  #accounts::account { 'don' : }
  #accounts::account { 'flannon' : }
  #accounts::account { 'joe' : }
  #accounts::account { 'ekate' : }

  # Addd dlib group to sudoers
  file_line { 'sudo_rule_nopw':
    path => '/etc/sudoers',
    line => '%dlib    ALL=(ALL)   NOPASSWD: ALL',
  }

  #include dltsyumrepo::dlts
  include dltsyumrepo::el7::test
  include dltsyumrepo::development
  ## Load hiera
  #include hiera
  ## Load the hieradata
  #hiera::hieradata { 'aspace-prod' : }
  #hiera::gitmodules { 'aspace-prod' : }

  #include puppetcron
  class { 'java':
    package => 'java-1.8.0-openjdk',
  }
  #include housekeeping::nfs

  # mount efs volumes
  #file { "${install_dir}/data" :
  #  ensure => directory,
  #  owner  => $user,
  #  group  => $user,
  #  mode   => '0755',
  #}

  
  include profiles::db_mysql
  include archivesspace::database
  include archivesspace

  #  require => Efsmount::Mount_volume['/opt/archivesspace/data/solr_backups'],
  #}

  ##
  #  Make sure the solr_home directory tree exists
  #    -- Should this actually be in the modules install class? Yes
  ##
  #$solr_home = [ "${install_dir}/data/solr_home",
  #              "${install_dir}/data/solr_home/collection1",
  #              "${install_dir}/data/solr_home/collection1/conf",
  #            ]
  #
  #file { $solr_home:
  #  ensure  => 'directory',
  #  owner   => $user,
  #  group   => $user,
  #  mode    => '0700',
  #  #require => Class['archivesspace::install'],
  #  #notify  => Archivesspace::Plugin['nyu_marcxml_export_plugin'],
  #}

  ##
  #  Load plugins
  ##
  #archivesspace::plugin { 'nyu_marcxml_export_plugin' :
  #  ensure          => 'present',
  #  plugin          => 'nyu_marcxml_export_plugin',
  #  plugin_source   => 'https://github.com/NYULibraries/nyu_marcxml_export_plugin.git',
  #  plugin_conf     => 'AppConfig[:plugins] = [\'nyu_marcxml_export_plugin\', \'nyu_ead_export_plugin\', \'nyu_sso_plugin\', \'digitization_work_order\']',
  #  #plugin_revision => $plugin_marcxml_export_revision,
  #  plugin_revision => 'production',
  #  require         => Class['archivesspace::install'],
  #}
  #archivesspace::plugin { 'nyu_ead_export_plugin' :
  #  ensure          => 'present',
  #  plugin          => 'nyu_ead_export_plugin',
  #  plugin_source   => 'https://github.com/NYULibraries/nyu_ead_export_plugin.git',
  #  plugin_conf     => 'AppConfig[:plugins] = [\'nyu_marcxml_export_plugin\', \'nyu_ead_export_plugin\', \'nyu_sso_plugin\', \'digitization_work_order\']',
  #  plugin_revision => $plugin_ead_export_revision,
  #  require         => Class['archivesspace::install'],
  #}
  #archivesspace::plugin { 'hudmol_digitization_work_order' :
  #  ensure          => 'present',
  #  plugin          => 'digitization_work_order',
  #  plugin_source   => 'https://github.com/hudmol/digitization_work_order.git',
  #  plugin_conf     => 'AppConfig[:plugins] = [\'nyu_marcxml_export_plugin\', \'nyu_ead_export_plugin\', \'nyu_sso_plugin\', \'digitization_work_order\']',
  #  plugin_revision => 'master',
  #  require         => Class['archivesspace::install'],
  #}
  #archivesspace::plugin { 'nyu_sso_plugin' :
  #  ensure          => present,
  #  plugin          => 'nyu_sso_plugin',
  #  plugin_source   => 'https://github.com/NYULibraries/nyu_sso_plugin.git',
  #  plugin_conf     => 'AppConfig[:plugins] = [\'nyu_marcxml_export_plugin\', \'nyu_ead_export_plugin\', \'nyu_sso_plugin\', \'digitization_work_order\']',
  #  plugin_revision => $plugin_sso_revision,
  #  require         => Class['archivesspace::install'],
  #}
  #exec { 'initialize-plugin.sh nyu_sso_plugin' :
  #  cwd     => "${install_dir}/plugins/nyu_sso_plugin",
  #  command => "${install_dir}/scripts/initialize-plugin.sh nyu_sso_plugin",
  #  timeout => 2600,
  #  creates => "${install_dir}/plugins/.initialize-nyu_sso_plugin-complete",
  #  require => Archivesspace::Plugin['nyu_sso_plugin'],
  #  notify  => File["${install_dir}/plugins/nyu_sso_plugin/.initialize-nyu_sso_plugin-complete"],
  #}->
  #class { 'archivesspace::service' : }
  #file { "${install_dir}/plugins/nyu_sso_plugin/.initialize-nyu_sso_plugin-complete" :
  #  ensure  => present,
  #  content => 'nyu_sso_plugin gems installed.',
  #  owner   => $user,
  #  group   => $group,
  #}
  firewall { '100 allow http and https access':
    dport  => [ 80, 8080, 8081, 8082, 8089, 8090, 8091 ],
    proto  => tcp,
    action => accept,
  }
  #firewall { '102 forward port 80 to 8080':
  #  table   => 'nat',
  #  chain   => 'PREROUTING',
  #  iniface => 'eth0',
  #  proto   => 'tcp',
  #  dport   => '80',
  #  jump    => 'REDIRECT',
  #  toports => 8080,
  #}

  # set up the db
  #include profiles::db_mysql
  #mysql::db { 'asdb' :
  #  user     => $db_user,
  #  password => $db_passwd,
  #  dbname   => $db_name,
  #  host     => 'localhost',
  #  grant    => [ 'ALL' ],
  #  #notify   => Class['archivesspace'],
  #}
  include mysql::client
  include mysql::bindings
  include pyenv
}
