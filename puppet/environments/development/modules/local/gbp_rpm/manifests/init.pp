# == Class: gbp_rpm
#
# Full description of class gbp here.
#
#  class { 'gbp_rpm':
#  }
#
#
class gbp_rpm {

  yumrepo { 'tools' :
    name     => 'tools',
    descr    => 'Marquiz gpb-rpm repository',
    baseurl  => 'https://download.tizen.org/tools/latest-release/CentOS_6',
    enabled  => 1,
    gpgcheck => 0,
  }

  #yumrepo { 'opennodecloud_tools' :
  #  name     => 'opennodecloud-tools',
  #  descr    => 'opennodecloud gpb-rpm repository',
  #  baseurl  => 'http://opennodecloud.com/CentOS/6/tools/',
  #  enabled  => 1,
  #  gpgcheck => 0,
  #}

  package { 'git-buildpackage-rpm' :
    ensure  => present,
    require => Yumrepo['tools'],
    #require => Yumrepo['opennodecloud_tools'],
  }

  package { 'librpm-tizen' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'librpm-tizen-debuginfo' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'bmap-tools' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'build' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'build-debuginfo' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'build-mkbaselibs' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'build-mkdrpms' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'createrepo-debuginfo' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs-api' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs-export' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs-jenkins-jobs' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs-jenkins-scripts' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'gbs-remotebuild' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'git-buildpackage-doc' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'isomd5sum' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'isomd5sum-debuginfo' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'pbzip2' :
    ensure  => present,
    require => Yumrepo['tools'],
  }


  package { 'pristine-tar' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'pristine-tar-debuginfo' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'python-argparse' :
    ensure  => present,
    require => Yumrepo['tools'],
  }

  package { 'python-coverage' :
    ensure  => present,
    require => Yumrepo['tools'],
  }


}

