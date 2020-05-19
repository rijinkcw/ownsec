#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/schweikert/fping.git
BRANCH=develop
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/fping
DSKTPFL=fping.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping

BANNER () {
	echo "${bold}
	 _____ ____ ___ _   _  ____ 
	|  ___|  _ \_ _| \ | |/ ___|
	| |_  | |_) | ||  \| | |  _ 
	|  _| |  __/| || |\  | |_| |
	|_|   |_|  |___|_| \_|\____|
		 
	INSTALL
	${normal}"
}

BUILD () {
	./autogen.sh
	./configure
	make -j 4
}

BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL
