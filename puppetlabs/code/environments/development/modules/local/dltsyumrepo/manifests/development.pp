#
class dltsyumrepo::development {
    yumrepo { 'dlts-development':
      ensure          => present,
      descr           => 'dlts-development',
      baseurl         => 'http://nexus.dlts.org:8081/nexus/content/repositories/dlts-development',
      enabled         => 1,
      protect         => 0,
      gpgcheck        => 0,
      metadata_expire => '30',
    }
}
