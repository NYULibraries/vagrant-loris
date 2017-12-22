class housekeeping::bastion {

  ensure_packages([
    'epel-release',
    'gdbm-devel',
    'lsof',
    'ncurses-devel',
    'openssl-devel',
    'zlib-devel',
  ])

}

