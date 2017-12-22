# == Class: profiles::svc_nfsclnt
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
#https://www.cyberciti.biz/faq/centos-fedora-rhel-nfs-v4-configuration/
class profiles::svc_nfs_client {


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

  file_line { '/etc/hosts' :
    path => '/etc/hosts',
    line =>  '192.168.250.10 nfs-server.local',
  }

  file_line { 'local_domain' :
    ensure => present,
    path   => '/etc/idmapd.conf',
    line   => 'Domain = local',
    after  => '^#Domain =',
  }

  #file { '/etc/idmapd' :
  #  ensure  => file,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
  #  content => template('profiles/idmapd.conf.erb')
  #}

  file { '/data' :
    ensure => directory,
    owner  => 'root',
    group  => 'dlib',
    mode   => '0775',
  }
  file_line { '/etc/fstab' :
    path =>  '/etc/fstab',
    #line => '192.168.250.10:/ /data nfs4 soft,intr,rsize=8192,wsize=8192,nosuid',
    line => '192.168.250.10:/data /data nfs4 sec=sys,noatime 0 0',
  }

  service { 'nfs' :
    enable =>  true,
    ensure => running,
  }

}
