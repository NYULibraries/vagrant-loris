#
define housekeeping::user {
  if $title == 'root' {
    $home_dir = '/root'
  }
  else {
    $home_dir = "/home/${title}"
  }
  $user = $title

  file_line { "${title} lo":
    path => "${home_dir}/.bashrc",
    line => 'alias lo=exit',
  }
  file_line { "${title} ls -F":
    path => "${home_dir}/.bashrc",
    line => 'alias ls="ls -F"',
  }
  file_line { "${title} more":
    path => "${home_dir}/.bashrc",
    line => 'alias more=less',
  }
  file_line { "${title} rm":
    path => "${home_dir}/.bashrc",
    line => 'alias rm="rm -i"',
  }
  file_line { "${title} ssh":
    path => "${home_dir}/.bashrc",
    line => 'alias ssh="ssh -o VisualHostKey=yes"',
  }
  file_line { "${title} vi":
    path => "${home_dir}/.bashrc",
    line => 'alias vi=vim',
  }
  if $title == 'root' {
    file_line { 'suspend' :
      path => "${home_dir}/.bashrc",
      line => 'alias s="suspend -f"',
    }
  }
  file_line { "${title} set":
    path => "${home_dir}/.bashrc",
    line => 'set -o vi',
  }

}
