#
class housekeeping::packages (
    $user = $housekeeping::params::user
) inherits housekeeping::params {

  ensure_packages([
    'bzip2-devel',
    'bind-utils',
    'deltarpm',
    'epel-release',
    'gdbm-devel',
    'gcc',
    'gcc-c++',
    'git',
    'htop',
    'libffi-devel',
    'libxslt-devel',
    'libyaml-devel',
    'lsof',
    'nfs-utils',
    'ncurses-devel',
    'make',
    'openssl-devel',
    'patch',
    'readline-devel',
    'sqlite-devel',
    'zlib-devel',
    'unzip',
    'yum-utils',
    'zip',
    'zlib-devel',
  ], {'ensure' => 'present'} )

}
