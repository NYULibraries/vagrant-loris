class dltsdevrepo {

    yumrepo { 'dlts-development':
      name            => 'dlts-development',
      baseurl         =>  'yum:letmein@172.31.46.70:8081/nexus/content/repositories/dlts-releases',
      enabled         => 1,
      protect         => 0,
      gpgcheck        => 0,
      metadata_expire => '30s',
      #autorefresh     => 1,
      #type            => 'rpm-md',
    }

}
