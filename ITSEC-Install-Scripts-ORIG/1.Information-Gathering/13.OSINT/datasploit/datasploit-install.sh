#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/DataSploit/datasploit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit
EXECUTEABLE1=datasploit.sh
EXECUTEABLE2=datasploit
EXECUTEABLE3=datasploit.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/datasploit
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/datasploit
DSKTPFL=datasploit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/datasploit

BANNER () {
	echo "${bold}
	 ____    _  _____  _    ____  ____  _     ___ ___ _____ 
	|  _ \  / \|_   _|/ \  / ___||  _ \| |   / _ \_ _|_   _|
	| | | |/ _ \ | | / _ \ \___ \| |_) | |  | | | | |  | |  
	| |_| / ___ \| |/ ___ \ ___) |  __/| |__| |_| | |  | |  
	|____/_/   \_\_/_/   \_\____/|_|   |_____\___/___| |_|  
		     
	INSTALL                                       
	${normal}"
}
PYEXEC () {
	echo '#!/bin/bash

	cd /opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit
	python datasploit.py "$@" ' > $GITREPOROOT/$EXECUTEABLE1
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
pur -r requirements.txt
PIP2INSTREQ
mv config_sample.py config.py
# vim config.py

# python datasploit.py test.com

PYEXEC
CHMODXEX1
CHMODXEX3
SYMLINKEX2TO1
CPDESKTFL
