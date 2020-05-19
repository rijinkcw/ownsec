#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/1aN0rmus/TekDefense-Automater.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus
EXECUTEABLE1=Automater.py
EXECUTEABLE2=automater
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFL=automater.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/tekdefense-automater

BANNER () {
	echo "${bold}
	    _   _   _ _____ ___  __  __    _  _____ _____ ____  
	   / \ | | | |_   _/ _ \|  \/  |  / \|_   _| ____|  _ \ 
	  / _ \| | | | | || | | | |\/| | / _ \ | | |  _| | |_) |
	 / ___ \ |_| | | || |_| | |  | |/ ___ \| | | |___|  _ < 
	/_/   \_\___/  |_| \___/|_|  |_/_/   \_\_| |_____|_| \_\
	INSTALL  
	${normal}"

}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL