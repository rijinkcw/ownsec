#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/fredericopissarra/t50
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50
GITCLONEDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/t50
DSKTPFL=t50.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/t50

BANNER () {
	echo "${bold}
	 _____ ____   ___  
	|_   _| ___| / _ \ 
	  | | |___ \| | | |
	  | |  ___) | |_| |
	  |_| |____/ \___/ 
		     
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
sudo make uninstall
GITSBMDLINIT
./configure
make -j 4
sudo make install
CPDESKTFL