# == Class: role::base
#
# Full description of class role here.
#
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class roles::base {
    notice('loading roles::init')
    include profiles::base
}
