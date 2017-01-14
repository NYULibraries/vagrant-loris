class rpmbuilder {

    package { 'createrepo' :
      ensure => present,
    }

    package { 'rpm-build' :
      ensure  => present,
      require => Class['yumutils'],
    }

    package { 'rpmdevtools' :
        ensure => present,
    }

    package { 'rpmlint' :
      ensure => present,
    }

    package { 'rpmrebuild' :
      ensure => present,
    }

    package { 'mock' :
      ensure => present,
    }

    package { 'rpm-python' :
      ensure => present,
    }


}
