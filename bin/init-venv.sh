#!/bin/bash

VENV=/var/www/loris2/virtualenv

yum install -y python-virtualenv.noarch
mkdir -p $VENV
cd ${VENV}/..
/bin/virtualenv virtualenv
