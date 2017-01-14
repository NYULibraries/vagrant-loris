#
class dltsyumrepo::test {
    yumrepo { 'dlts-test':
      ensure          => present,
      descr           => 'dlts-test',
      baseurl         => 'http://nexus-dev.dlts.org:8081/nexus/content/repositories/dlts-test/',
      enabled         => 1,
      protect         => 0,
      gpgcheck        => 0,
      metadata_expire => '30',
    }
}
