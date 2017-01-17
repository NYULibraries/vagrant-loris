## vagrant-loris


### Table of Contents

1. [Overview] (#overview)
2. [Pre-Install] (#pre-install)
3. [Usage] (#usage)


#### Overview

A vagrant box running the loris image server.


#### Pre-Installation Setup

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

Port 9080 on the host is mapped to port 80 on the guest.  Loris is available at,

    http://localhost:9080/loris/

 There is a demo image in the loris image cache.  The image metadata ca be viewed at,

    http://localhost:9080/loris/001.jp2/info.json

and the image can be viewed at,

    http://localhost:9080/loris/001.jp2/full/640,/0/default.png

You can resize the image by changing the 5th element of the URL's path like this,

    http://localhost:9080/loris/001.jp2/full/940,/0/default.png
