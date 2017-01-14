#!/bin/bash

cd /tmp
curl -#LO https://rvm.io/mpapis.asc
gpg --import /tmp/mpapis.asc
