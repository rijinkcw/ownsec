#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/pcoder/DNSTracer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder
EXECUTEABLE1=mypydig.py
EXECUTEABLE2=dnstracer
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnstracer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/dnstracer
DSKTPFL=dnstracer.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 ____  _   _ ____ _____ ____      _    ____ _____ ____  
	|  _ \| \ | / ___|_   _|  _ \    / \  / ___| ____|  _ \ 
	| | | |  \| \___ \ | | | |_) |  / _ \| |   |  _| | |_) |
	| |_| | |\  |___) || | |  _ <  / ___ \ |___| |___|  _ < 
	|____/|_| \_|____/ |_| |_| \_\/_/   \_\____|_____|_| \_\
		    
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
CPDESKTFL
