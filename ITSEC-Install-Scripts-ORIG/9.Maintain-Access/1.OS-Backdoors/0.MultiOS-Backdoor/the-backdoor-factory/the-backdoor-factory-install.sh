#!/bin/bash

## Backdoor Factory Setup - XFCE, 16.04

######################## CONFIG_MAIN - START ########################

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/alphaaurigae/backdoor-factory_install
BRANCH=xenial
GITREPOROOT=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory/backdoor-factory_install
GITCLONEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory

######################## CONFIG_MAIN - END ########################

INSTALLROUTINE1 () {
cd $GITREPOROOT
./backdoor-factory-install
}

######################## MISC - START ########################
# color
bold=$(tput bold)
normal=$(tput sgr0)
CYAN='\e[0;36m'
GREEN='\e[0;32m'
WHITE='\e[0;37m'
RED='\e[0;31m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
ORANGE='\e[38;5;166m'

# git clone 
GITCLONEFUNC () {
mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
}
# END git clone 

# init submodules
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

GITCLONEFUNC

INSTALLROUTINE1