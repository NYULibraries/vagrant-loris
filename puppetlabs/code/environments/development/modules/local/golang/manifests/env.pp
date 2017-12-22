#
define golang::env {

  $user = $title

  if $title == 'root' {
    $userhome = "/${title}"
  }
  else {
    $userhome = "/home/$title"
  }

  file_line { "${userhome} goroot":
    path => "${userhome}/.bashrc",
    line => 'export GOROOT=$(go env GOROOT)',
  }
  file_line { "${userhome} gopath":
    path => "${userhome}/.bashrc",
    line => "export GOPATH=$(go env GOPATH)",
  }
  #file_line { "${userhome} gobin":
  #  path => "${userhome}/.bashrc",
  #  line => "export GOBIN=${userhome}/go/bin",
  #}
  file_line { "${userhome} userpath":
    path => "${userhome}/.bashrc",
    line => 'export PATH=$PATH:$(go env GOPATH)/bin',
  }
  $godirs = [
              "${userhome}/go", 
              "${userhome}/go/bin", 
              "${userhome}/go/pkg", 
              "${userhome}/go/src", 
              "${userhome}/go/projects", 
            ]
  file { $godirs :
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }
}
