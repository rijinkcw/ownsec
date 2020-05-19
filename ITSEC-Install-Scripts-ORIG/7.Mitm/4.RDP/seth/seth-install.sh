#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SySS-Research/Seth
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
GITCLONEDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research
EXECUTEABLE1=seth.sh
EXECUTEABLE2=seth
EXECUTEABLE3=seth.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/4.RDP/seth
DSKTPFL=seth.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth

BANNER () {
	echo "${bold}
	 ____  _____ _____ _   _ 
	/ ___|| ____|_   _| | | |
	\___ \|  _|   | | | |_| |
	 ___) | |___  | | |  _  |
	|____/|_____| |_| |_| |_|
		                 
	INSTALL /SySS-Research/Seth
	${normal}"
}
DEPS () {
	# python3 tcpdump arpspoof openssl
	# arpspoof is part of dsniff

}
PYEXEC () {
	echo '#!/bin/bash -i 

	cd /opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
	python seth.py "$@"' > $GITREPOROOT/$EXECUTEABLE1
}

BANNER
GITCLONEFUNC
DEPS
GITSBMDLINIT
PYEXEC
CHMODXEX1
CHMODXEX3
SYMLINKEX2TO1
CPDESKTFL
