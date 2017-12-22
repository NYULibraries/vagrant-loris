1. Before building YouCompleteMe enable scl devtoolset-4 by uncommenting the
following line in .bashrc and then sourcing .bashrc and installing plugins,

  .bashrc: #scl enable devtoolset-4 bash
  $ . .bashrc
  $ vim +PluginInstall +qall

2. Upgrade vim to vim8

  $ sudo yum install vim-minimal vim-enhanced

Then build YouCompleteMe

  $ cd ~/.vim/bundle/YouCompleteMe
  $ ./install.py -all
  

TODO

  - Right now it works for centos
    - structure vim::setup for Centos and Darwin
    - same goes for init

