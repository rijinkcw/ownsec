#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/trustedsec/pivoter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/pivoter
DSKTPFL=pivoter.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/pivoter

BANNER () {
	echo "${bold}
	 ____ _____     _____ _____ _____ ____  
	|  _ \_ _\ \   / / _ \_   _| ____|  _ \ 
	| |_) | | \ \ / / | | || | |  _| | |_) |
	|  __/| |  \ V /| |_| || | | |___|  _ < 
	|_|  |___|  \_/  \___/ |_| |_____|_| \_\
		        
	INSTALL                               
	${normal}"
}

BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT

