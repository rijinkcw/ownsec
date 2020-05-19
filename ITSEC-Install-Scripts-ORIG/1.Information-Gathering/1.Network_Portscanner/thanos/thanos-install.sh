#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/P0cL4bs/Thanos.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
EXECUTEABLE1=thanos	
EXECUTEABLE2=thanos
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFL=thanos.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos

BANNER () {
	echo "${bold}
	 _____ _   _    _    _   _  ___  ____  
	|_   _| | | |  / \  | \ | |/ _ \/ ___| 
	  | | | |_| | / _ \ |  \| | | | \___ \ 
	  | | |  _  |/ ___ \| |\  | |_| |___) |
	  |_| |_| |_/_/   \_\_| \_|\___/|____/ 

	INSTALL
	${normal}"
}

DEPS () {

	LIBS_DEPS="libsqlite3-0
	libsqlite3-dev"

	sudo apt-get update
	sudo apt-get upgrade

	echo $LIBS_DEPS | while read libsdeps
	do
	   sudo apt-get install -y $libsdeps
	done

	sudo updatedb
	sudo ldconfig
}

BANNER
DEPS
GITCLONEFUNC
#make clean
GITSBMDLINIT
make -j 4
#sudo make install

CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL

thanos --new-db banner_grabber.db
