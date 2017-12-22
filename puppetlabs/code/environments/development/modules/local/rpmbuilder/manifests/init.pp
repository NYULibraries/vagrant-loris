class rpmbuilder {

  ensure_packages([
    'createrepo',
    'yum-utils',
    'rpm-build',
    'rpmdevtools',
    'rpmlint',
    'rpmrebuild',
    'mock',
    'rpm-python',
  ], { 'ensure' => 'present'})



}
