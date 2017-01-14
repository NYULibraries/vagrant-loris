class motd {
  case $::virtual {
    'kvm': { 
        file { "/etc/motd":
            ensure => file,
            source => "puppet:///modules/motd/motd.vagrant",
        }
     }
    'xenu': { 
        file { "/etc/motd":
            ensure => file,
            source => "puppet:///modules/motd/motd.dlts-aws",
        }
     }
    'xenhvm': { 
        file { "/etc/motd":
            ensure => file,
            source => "puppet:///modules/motd/motd.dlts-aws",
        }
     }
    default: { 
        file { "/etc/motd":
            ensure => file,
            source => "puppet:///modules/motd/motd",
        }
     }
  }
  #if $ec2_instance_id == uned and !("" in [$ec2_instance_id]) {
  #    file { "/etc/motd":
  #        ensure => file,
  #        source => "puppet:///modules/motd/motd.dlts-aws",
  #    }
  #}
}
