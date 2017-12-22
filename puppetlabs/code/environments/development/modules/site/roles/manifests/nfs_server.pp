class roles::nfs_server {
  include profiles::base
  include profiles::svc_nfs_server
}
