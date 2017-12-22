# == Class: role::archivesspace
#
# Full description of class role here.
#
# === Authors
#
# Flannon Jackson <flannon@nyu.edu>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class roles::archivesspace {

    include profiles::base
    include profiles::db_mysql
    include profiles::webapp_archivesspace

}
