#
class roles::archivesspace_devenv {
    include profiles::base
    #require profiles::db_mysql
    include profiles::dev_aspace_devenv
    #include profiles::rbenv_profile
}
