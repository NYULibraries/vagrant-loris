#!/bin/bash

SSHRDIR="/root/.aws"
SSHVDIR="/home/vagrant/.aws"

if [[ ! -d $SSHRDIR ]]; then
    mkdir $SSHRDIR
    chmod 700 $SSHRDIR
fi
if [[ ! -d $SSHVDIR ]]; then
    mkdir $SSHVDIR
    chmod 700 $SSHVDIR
fi
#cp /vagrant/untracked-files/ssh/id_rsa* $SSHRDIR
cp /vagrant/untracked-files/ssh/id_rsa* $SSHVDIR
chown -R vagrant:vagrant $SSHVDIR
#chmod 600 /home/vagrant/.ssh/id_rsa
#chmod 644 /home/vagrant/.ssh/id_rsa.pub
cp /vagrant/files/known_hosts /home/vagrant/.ssh
#chmod 644 /home/vagrant/.ssh
