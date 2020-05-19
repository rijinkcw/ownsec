#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/p0f/p0f.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/p0f/p0f/p0f
GITCLONEDIR=/opt/ITSEC/7.Mitm/p0f/p0f
EXECUTEABLE1=p0f.sh
EXECUTEABLE2=p0f
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/p0f
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/p0f
DSKTPFL=p0f.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/p0f

BANNER () {
	echo "${bold}
	 ____   ___  _____ 
	|  _ \ / _ \|  ___|
	| |_) | | | | |_   
	|  __/| |_| |  _|  
	|_|    \___/|_|    
		     
	INSTALL             
	${normal}"
}
BINEXEC () {
	echo '#!/bin/bash

	cd /opt/ITSEC/7.Mitm/p0f/p0f/p0f
	./p0f "$@" ' > $GITREPOROOT/$EXECUTEABLE1
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
make -j 4
BINEXEC
CHMODXEX2
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL