define maven::mvn($remote_location=undef, $mode='0644'){
  exec{"retrieve_${title}":
    command => "/usr/bin/wget -q ${remote_location} -O ${title}",
    creates => $title,
  }
  file {$title:
    mode    => $mode,
    require => Exec["retrieve_${title}"],
  }
}
