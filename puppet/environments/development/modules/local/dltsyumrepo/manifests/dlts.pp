#
class dltsyumrepo::dlts {
    yumrepo { 'dlts':
      ensure          => present,
      descr           => 'dlts',
      baseurl         => 'http://nexus-dev.dlts.org:8081/nexus/content/repositories/dlts/',
      enabled         => 1,
      protect         => 0,
      gpgcheck        => 0,
      metadata_expire => '30',
    }
}
