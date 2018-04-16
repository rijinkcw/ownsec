#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap
# 1. Install deps

cd $BASEDIR

# check if go is installed, if not install
if [ ! -d /home/$USER/go ]; then
echo "go not installed, installing!"
cd /opt/ownsec/0.Initial/src/PT2/1.Deps_Install
./5.GO-gophers-apt-Install.sh
source ~/.bashrc
fi
# end go install

./bettercap-deps.sh

source ~/.bashrc

./bettercap-install.sh