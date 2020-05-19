#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/yrutschle/sslh.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITCLONEDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/sslh
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/sslh
DSKTPFL=sslh.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/sslh

BANNER () {
	echo "${bold}
	 ____ ____  _     _   _ 
	/ ___/ ___|| |   | | | |
	\___ \___ \| |   | |_| |
	 ___) |__) | |___|  _  |
	|____/____/|_____|_| |_|

	INSTALL
	${normal}"
}
SET_ALTERNATIVES () {
	# set default version ( 4 = gcc 7)
	yes "1" | sudo update-alternatives --config gcc 
	expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
	yes "1" | sudo update-alternatives --config g++ 
	expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
	gcc -v
	g++ -v
}

REVERT_ALTERNATIVES () {
	# revert default version ( 4 = gcc 7)
	yes "4" | sudo update-alternatives --config gcc 
	expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
	yes "4" | sudo update-alternatives --config g++ 
	expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
	gcc -v
	g++ -v
}

DEPS () {
	LIBS_DEPS="libwrap0-dev 
	libconfig-dev
	libconfig++-dev"

	sudo apt-get update
	sudo apt-get upgrade

	echo $LIBS_DEPS | while read libsdeps
	do
	   sudo apt-get install -y $libsdeps
	done

	# sudo -H pip2 uninstall virtualenvwrapper
	sudo ldconfig
	sudo updatedb
	 
	# sudo -H pip2 install -r requirements.txt
	sudo updatedb
	sudo ldconfig
}

BANNER
DEPS
GITCLONEFUNC
GITSBMDLINIT
make clean

SET_ALTERNATIVES
make -j 4

sudo make install
REVERT_ALTERNATIVES
CPDESKTFL

