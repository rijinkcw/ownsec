#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/samyk/pwnat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat
GITCLONEDIR=/opt/ITSEC/8.Tunnel/pwnat/samyk
EXECUTEABLE1=pwnat	
EXECUTEABLE2=pwnat
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/pwnat
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/pwnat
DSKTPFL=pwnat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/pwnat

BANNER () {
	echo "${bold}
	 ______        ___   _    _  _____ 
	|  _ \ \      / / \ | |  / \|_   _|
	| |_) \ \ /\ / /|  \| | / _ \ | |  
	|  __/ \ V  V / | |\  |/ ___ \| |  
	|_|     \_/\_/  |_| \_/_/   \_\_|  
		     
	INSTALL
	${normal}"
}


BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
make -j 4
SYMLINKEX2TO1
CPDESKTFL