#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/portcullislabs/enum4linux.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
EXECUTEABLE1=enum4linux.pl 
EXECUTEABLE2=enum4linux
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/6.SMB/enum4linux
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB/enum4linux
DSKTPFL=enum4linux.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 _____ _   _ _   _ __  __ _  _   _     ___ _   _ _   ___  __
	| ____| \ | | | | |  \/  | || | | |   |_ _| \ | | | | \ \/ /
	|  _| |  \| | | | | |\/| | || |_| |    | ||  \| | | | |\  / 
	| |___| |\  | |_| | |  | |__   _| |___ | || |\  | |_| |/  \ 
	|_____|_| \_|\___/|_|  |_|  |_| |_____|___|_| \_|\___//_/\_\
	   
	INSTALL
	${normal}"

}

BANNER
GITCLONEFUNC
GITSBMDLINIT
chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
CPDESKTFL


