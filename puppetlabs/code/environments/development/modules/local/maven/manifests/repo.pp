# == Class: epel_apache_maven
#
# Full description of class epel_apache_maven here.
#
# === Parameters
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class maven::repo {

  yumrepo {
    'epel-apache-maven' :
      descr                => 'epel-apache-maven',
      baseurl             => 'http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-$releasever/$basearch/',
      enabled             => '1',
      skip_if_unavailable => '1',
      gpgcheck            => '0';
    'epel-apache-maven-source' :
      descr               => 'epel-apache-maven-source',
      baseurl             => 'http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-$releasever/SRPMS',
      enabled             => '0',
      skip_if_unavailable => '1',
      gpgcheck            => '0',
  }

}
