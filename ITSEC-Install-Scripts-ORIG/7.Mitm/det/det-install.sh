#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sensepost/DET.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/det/sensepost/DET
GITCLONEDIR=/opt/ITSEC/7.Mitm/det/sensepost
EXECUTEABLE1=det.sh
EXECUTEABLE2=det
EXECUTEABLE3=det.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/det
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/det
DSKTPFL=det.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/det

BANNER () {
	echo "${bold}
	 ____  _____ _____ 
	|  _ \| ____|_   _|
	| | | |  _|   | |  
	| |_| | |___  | |  
	|____/|_____| |_|  
		  
	INSTALL
	${normal}"
}

PYEXEC	() {
	echo '#!/bin/bash -i 

	cd /opt/ITSEC/7.Mitm/det/sensepost/DET
	python det.py "$@"' > $GITREPOROOT/$EXECUTEABLE1
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
PYEXEC
CHMODXEX1
CHMODXEX3
SYMLINKEX2TO1
CPDESKTFL
