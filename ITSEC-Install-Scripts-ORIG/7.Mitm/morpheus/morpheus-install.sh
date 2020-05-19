#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/r00t-3xp10it/morpheus.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it/morpheus
GITCLONEDIR=/opt/ITSEC/7.Mitm/morpheus/r00t-3xp10it
EXECUTEABLE1=morpheus.sh
EXECUTEABLE2=morpheus
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/morpheus
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/morpheus
DSKTPFL=morpheus.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/morpheus

BANNER () {
	echo "${bold}
	 __  __  ___  ____  ____  _   _ _____ _   _ ____  
	|  \/  |/ _ \|  _ \|  _ \| | | | ____| | | / ___| 
	| |\/| | | | | |_) | |_) | |_| |  _| | | | \___ \ 
	| |  | | |_| |  _ <|  __/|  _  | |___| |_| |___) |
	|_|  |_|\___/|_| \_\_|   |_| |_|_____|\___/|____/ 
		      
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-morpheus.txt") -r -- sudo apt-get install -y
}


BANNER
GITCLONEFUNC
DEPS
GITSBMDLINIT
SYMLINKEX2TO1
CPDESKTFL