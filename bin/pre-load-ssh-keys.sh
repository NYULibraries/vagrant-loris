#!/bin/bash

SSHDIR="$(pwd)/untracked-files/ssh"
UNTRKD="$(pwd)/untracked-files"

if [[ ! -d $UNTRKD ]]; then
    mkdir $UNTRKD
fi

if [[ ! -d $SSHDIR ]]; then
    mkdir $SSHDIR
fi

cp ~/.ssh/id_rsa* $SSHDIR
cp ~/.ssh/known_hosts $SSHDIR

#cp /vagrant/untracked-files/ssh/* /home/vagrant/.ssh
#chown -R vagrant:vagrant /home/vagrant/.ssh/*
#chmod 600 /home/vagrant/.ssh/*
#cp /vagrant/files/known_hosts /home/vagrant/.ssh
#chmod 644 /home/vagrant/.ssh

#cp /vagrant/untracked-files/ssh/id_rsa* /home/vagrant/.ssh
#chown -R vagrant:vagrant /home/vagrant/.ssh/*
#chmod 600 /home/vagrant/.ssh/id_rsa
#chmod 644 /home/vagrant/.ssh/id_rsa.pub
#cp /vagrant/files/known_hosts /home/vagrant/.ssh
#chmod 644 /home/vagrant/.ssh
