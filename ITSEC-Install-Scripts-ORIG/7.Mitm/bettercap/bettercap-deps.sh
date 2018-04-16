#!/bin/bash

APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap

cd /opt/ownsec/0.Initial/src/PT2/1.Deps_Install
./5.GO-gophers-apt-Install.sh
source ~/.bashrc
### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-bettercap.txt") -r -- sudo apt-get install -y
### DEPS END
