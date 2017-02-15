#!/bin/bash

USER=loris
VENVDIR=/var/www/loris2
VENV=virtualenv

if [[ ! -d ${VENVDIR}/${VENV} ]]
then

  useradd -d $VENVDIR $USER
  yum install -y python-virtualenv.noarch
  mkdir -p ${VENVDIR}/${VENV}
  cd ${VENVDIR}
  /bin/virtualenv virtualenv
  chown -R $USER: $VENVDIR

fi
