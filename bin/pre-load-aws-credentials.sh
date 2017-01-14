#!/bin/bash

AWSDIR="$(pwd)/untracked-files/aws"
UNTRKD="$(pwd)/untracked-files"

if [[ ! -d $UNTRKD ]]; then
    mkdir $UNTRKD
fi

if [[ ! -d $AWSDIR ]]; then
    mkdir $AWSDIR
fi

cp ~/.aws/config $AWSDIR
cp ~/.aws/credentials $AWSDIR
