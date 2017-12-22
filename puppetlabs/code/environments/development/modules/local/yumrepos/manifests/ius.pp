#
class yumrepos::ius {

  file { '/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY' :
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    #source => 'https://github.com/iuscommunity-pkg/ius-release/SOURCES/IUS-COMMUNITY-GPG-KEY',
    source => 'https://raw.githubusercontent.com/iuscommunity-pkg/ius-release/master/SOURCES/IUS-COMMUNITY-GPG-KEY',
  }

    yumrepo { 'ius.repo' :
      name            => 'ius',
      ensure          => present,
      descr           => 'IUS Community Packages for Enterprise Linux 7 - $basearch',
      baseurl         => 'https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/$basearch',
      mirrorlist      => 'https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos7&arch=$basearch&protocol=http',
      enabled         => 1,
      failovermethod  => 'priority',
      protect         => 0,
      gpgcheck        => 0,
      metadata_expire => '30',
    }
}
