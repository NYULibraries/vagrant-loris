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

node /nexus/ {
  include roles::nexus
}

node /solr-server/ {
  include roles::solr
}

node default {
  notice('Loading node default')
  include roles
}
