# define vim::setup
# ===========================
#
# Full description of class vim here.
#
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
define vim::setup(
  String $home = lookup('vim::home', String, 'first'),
  String $position = lookup('vim::position'),
  String $user = '$title',
  String $vimrc = "$home/${title}/.vimrc"
){

  #alert("vim::home - $home")
  #alert("vim::positon - $position")

  #file_line { 'alias_vi' :
  #  ensure => present,
  #  path   => "${home}/${title}/.bashrc",
  #  line   => 'alias vi=vim',
  #}

  #file_line { 'scl_source devtoolset-4' :
  #  ensure => present,
  #  path   => "${home}/${title}/.bashrc",
  #  line   => '#source scl_source enable devtoolset-4',
  #}
  
  #alert("From the defined type: $title")

  file { "${home}/${title}/.vim" :
    ensure  => directory,
    owner   => $title,
    group   => $title,
    mode    => '0755',
    recurse => true,
  }
  file { "${home}/${title}/.vim/bundle" :
    ensure  => directory,
    owner   => $title,
    group   => $title,
    mode    => '0755',
    #recurse => true,
  }
  vcsrepo { "${home}/${title}/.vim/bundle/Vundle.vim" :
    ensure   => present,
    force    => true,
    provider => git,
    source   => 'git://github.com/VundleVim/Vundle.vim.git',
    user     => $title,
    revision => 'v0.10.2',
  }

  #exec { "git Vundle.vim" :
  #  command => "git clone https://github.com/VundleVim/Vundle.vim.git --branch v0.10.2 ${home}/${title}/.vim/bundle/Vundle.vim",
  #  #command => "git clone https://github.com/gmarik/Vundle.vim.git --branch ${home}/${title}/.vim/bundle/Vundle.vim",
  #  #cwd     => "${home}/${title}/.vimrc/bundle",
  #  path    => "/opt/rh/devtoolset-4/root/usr/bin/:/bin:/usr/bin:/usr/local/bin",
  #  creates => "${home}/${title}/.vim/bundle/Vundle.vim",
  #}

  concat { "${home}/${title}/.vimrc" :
    owner   => $title,
    group   => $title,
    mode    => '0644',
    replace => true,
  }
  concat::fragment{ 'vimrc_header':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_header",
    order  => '01',
  }
  concat::fragment{ 'vimrc_colorscheme':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_colorscheme",
    order  => '02',
  }
  concat::fragment{ 'vimrc_footer':
    target => $vimrc,
    source => "puppet:///modules/vim/vimrc_footer",
    order  => '03',
  }

  # TODO
  # - figure out how to run PluginInstall
  #exec { 'PluginInstall' :
  #  command => '/usr/local/bin/vim +PluginInstall +qall 2>&1 1> /dev/null',
  #  path    => '/usr/local/bin',
  #}

  # - set vim as the git global editor
  #exec { 'git_editor' :
  #  command => 'git config --global core.editor $(which vim)',
  #  path => [ "/usr/local/bin/git", "/usr/bin" ],
  #}

}
