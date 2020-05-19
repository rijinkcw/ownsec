#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/astroza/udptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/udptunnel/astroza
EXECUTEABLE1=client
EXECUTEABLE2=udptunnel
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/udptunnel
DSKTPFL=udptunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel

BANNER () {
	echo "${bold}
	 _   _ ____  ____ _____ _   _ _   _ _   _ _____ _     
	| | | |  _ \|  _ \_   _| | | | \ | | \ | | ____| |    
	| | | | | | | |_) || | | | | |  \| |  \| |  _| | |    
	| |_| | |_| |  __/ | | | |_| | |\  | |\  | |___| |___ 
	 \___/|____/|_|    |_|  \___/|_| \_|_| \_|_____|_____|
		  
	INSTALL
	${normal}"
}


BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
make -j 4
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL