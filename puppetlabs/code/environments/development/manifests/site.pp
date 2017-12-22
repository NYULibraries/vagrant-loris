node /^bastion/ {
  include roles::bastion
}

node /^container/ {
  include roles::container
}

node /loris/ {
  include roles::loris
}

node /fedora/ {
  include roles::fedora3
}

node /ichabod/ {
  include roles::ichabod
}

node /jetty/ {
  include roles::jetty
}

node /kbmaster/ {
  include roles::kbmaster
}

node /nexus/ {
  include roles::nexus
}

node /puppet4/ {
  include roles::puppet4
}


node /puppet/ {
  include roles::puppet_enterprise
}

node /solr-server/ {
  include roles::solr
}

node /spacewalk/ {
  include roles::spacewalk
}

node /test-rvm/ {
  include roles::test_rvm
}

node /tlon/ {
  include roles::tlon
}

node /theforeman/ {
  include roles::theforeman
}

node /rpmfactory/ {
  include roles::rpmfactory
}

node /uqbar/ {
  include roles::uqbar
}

node default {
  notice('Loading node default')
  include roles
}
