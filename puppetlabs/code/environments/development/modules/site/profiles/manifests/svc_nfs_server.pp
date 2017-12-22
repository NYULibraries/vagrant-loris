# == Class: profiles::svc_nfs_server
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
class profiles::svc_nfs_server {

  # Add default group and users
  group { 'dlib' :
    ensure => present,
    gid    => '200',
  }

  ensure_packages({
    'nfs-utils'      => { ensure => present },
    'rpcbind'        => { ensure => present },
    'nfs4-acl-tools' => { ensure => present },
  }, { 'ensure' => 'present' } )

  file { '/exports' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file { '/exports/data' :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777',
  }
  file_line { 'export_volume' :
    path => '/etc/exports',
    line =>  '/exports  192.168.250.0/24(ro,no_subtree_check,fsid=0,crossmnt)',
  }
  file_line { 'export_directory' :
    path => '/etc/exports',
    line =>  '/exports/data  192.168.250.0/24(rw,no_subtree_check,no_root_squach)',
  }

  file_line { 'fstab_01' :
    path => '/etc/fstab',
    line => '/data  /exports/data  none  bind  0 0',
  }
  service { 'nfs' :
    enable =>  true,
    ensure => running,
  }
    
  file_line { '/etc/hosts' :
    path => '/etc/hosts',
    line =>  '192.168.250.11 nfs-client.local',
  }

  firewall { '100 allow nfs access on 2049' :
    dport  => [111, 662, 892, 1039, 1047, 1048, 2049, 32803, 38467, 32769],
    proto  => tcp,
    action => accept,
    source => '192.168.250.11',
  }


}
