#!/bin/bash

AWSRDIR="/root/.aws"
AWSVDIR="/home/vagrant/.aws"

if [[ ! -d $AWSRDIR ]]; then
    mkdir $AWSRDIR
    chmod 700 $AWSRDIR
fi
if [[ ! -d $AWSVDIR ]]; then
    mkdir $AWSVDIR
    chmod 700 $AWSVDIR
fi

cp /vagrant/untracked-files/aws/* $AWSRDIR
chmod 600 $AWSRDIR/*

cp /vagrant/untracked-files/aws/* $AWSVDIR
chown -R vagrant:vagrant $AWSVDIR
chmod 600 $AWSVDIR/*
