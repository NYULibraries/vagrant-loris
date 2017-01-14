# vagrant-lors


## Table of Contents

1. [Overview] (#overview)
2. [Pre-Install] (#pre-install)
3. [Usage] (#usage)


#### Overview

A vagrant box running the loris image server.


#### Pre-Installaiton Setup

To run the vagrant installer you will need Virtualbox, vagrant, and the 
vagrant plugins vagrant-r10k, and vagrant-vbguest.  If you're on a Mac the easiest way to install everything you'll need is with homebrew.  The following steps will install homebrew and everything you need to get vagrant running


    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    $ brew cask install virtualbox
    $ brew cask install vagrant
    $ brew cask install vagrant-manager
    $ vagrant plugin install vagrant-r10k
    $ vagrant plugin install vagrant-vbguest


#### Usage

Clone vagrant-loris,

    $ git clone https://gitlab.com/NYULibraries/vagrant-loris.git 
    $ cd vagrant-loris
    $ vagrant up


Then to connect to your vagrant box you can,

    $ vagrant ssh

Port 9080 on your host is mapped to port 80 on the guest.  Loris is available at,

        http://localhost:9080/loris/


