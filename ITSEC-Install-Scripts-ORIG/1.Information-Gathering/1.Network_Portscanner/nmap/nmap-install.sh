#!/usr/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/alphaaurigae/nmap_install
BRANCH=18.04-bionic_beaver
GITREPOROOT=/opt/ownsec/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap_install
GITCLONEDIR=/opt/ownsec/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap

GITCLONEFUNC

./nmap-install.sh