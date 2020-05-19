#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/bonsaiviking/NfSpy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy
GITCLONEDIR=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/nfspy
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/nfspy
DSKTPFL=nfspy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/nfspy

BANNER () {
	echo "${bold}
	 _   _ _____ ____  ______   __
	| \ | |  ___/ ___||  _ \ \ / /
	|  \| | |_  \___ \| |_) \ V / 
	| |\  |  _|  ___) |  __/ | |  
	|_| \_|_|   |____/|_|    |_|  
		
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
sudo python setup.py install
CPDESKTFL