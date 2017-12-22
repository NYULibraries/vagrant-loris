## vagrant-loris


### Table of Contents

1. [Overview] (#overview)
2. [Pre-Install] (#pre-install)
3. [Usage] (#usage)


#### Overview

A vagrant box running the loris image server.


#### Pre-Installation Setup

To run the vagrant installer you will need Virtualbox  and vagrant v2.0.1 or later. The Vagrant file also requires several vagrant plugins that will be installed for you if you don't already have them. If you're on a Mac the easiest way to install everything you'll need is with homebrew.  The following steps will install homebrew and everything you need to get vagrant running


    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    $ brew cask install virtualbox
    $ brew cask install vagrant


#### Usage

Clone vagrant-loris,

    $ git clone https://gitlab.com/NYULibraries/vagrant-loris.git 
    $ cd vagrant-loris
    $ vagrant up


Then to connect to your vagrant box you can,

    $ vagrant ssh

Port 9080 on the host is mapped to port 80 on the guest.  Loris is available at,

    http://localhost:9080/loris/

 There is a demo image in the loris image cache.  The image metadata can be viewed at,

    http://localhost:9080/loris/001.jp2/info.json

and the image can be viewed at,

    http://localhost:9080/loris/001.jp2/full/640,/0/default.png

The loris image cache is located at /usr/local/share/images/ on the guest.

You can resize the image by changing the 5th element of the URL's path like this,

    http://localhost:9080/loris/001.jp2/full/940,/0/default.png
