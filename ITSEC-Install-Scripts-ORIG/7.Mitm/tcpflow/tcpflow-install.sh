#!/bin/bash 

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/simsong/tcpflow.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow
GITCLONEDIR=/opt/ITSEC/7.Mitm/tcpflow/simsong
EXECUTEABLE1=tcpflow
EXECUTEABLE2=tcpflow
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/tcpflow
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/tcpflow
DSKTPFL=tcpflow.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/tcpflow

BANNER () {
	echo "${bold}
	 _____ ____ ____  _____ _     _____        __
	|_   _/ ___|  _ \|  ___| |   / _ \ \      / /
	  | || |   | |_) | |_  | |  | | | \ \ /\ / / 
	  | || |___|  __/|  _| | |__| |_| |\ V  V /  
	  |_| \____|_|   |_|   |_____\___/  \_/\_/   
		 
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-tcpflow.txt") -r -- sudo apt-get install -y
}


BUILD () {
	./bootstrap.sh
	./configure
	make -j 4
}
BANNER
GITCLONEFUNC
make clean
sudo make uninstall
DEPS
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL
