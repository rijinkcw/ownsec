#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/robertdavidgraham/masscan.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham/masscan
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/masscan
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/masscan
DSKTPFL=masscan.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/masscan

BANNER () {
	echo "${bold}
	 __  __    _    ____ ____   ____    _    _   _ 
	|  \/  |  / \  / ___/ ___| / ___|  / \  | \ | |
	| |\/| | / _ \ \___ \___ \| |     / _ \ |  \| |
	| |  | |/ ___ \ ___) |__) | |___ / ___ \| |\  |
	|_|  |_/_/   \_\____/____/ \____/_/   \_\_| \_|
		
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-masscan.txt") -r -- sudo apt-get install -y
	sudo updatedb
	sudo ldconfig
}

BANNER
DEPS
GITCLONEFUNC
GITSBMDLINIT
make -j 4
sudo make install
CPDESKTFL



