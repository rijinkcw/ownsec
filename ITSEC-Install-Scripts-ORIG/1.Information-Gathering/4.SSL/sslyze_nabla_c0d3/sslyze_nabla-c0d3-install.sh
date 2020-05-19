#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nabla-c0d3/sslyze.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3/sslyze
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslyze_nabla-c0d3
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL/sslyze_nabla-c0d3
DSKTPFL=sslyze.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslyze_nabla-c0d3

BANNER () {
	echo "${bold}
	 ____ ____  _  __   ____________ 
	/ ___/ ___|| | \ \ / /__  / ____|
	\___ \___ \| |  \ V /  / /|  _|  
	 ___) |__) | |___| |  / /_| |___ 
	|____/____/|_____|_| /____|_____|
		   
	INSTALL
	${normal}"
}

DEPS () {
	sudo -H pip install -r requirements.txt
	sudo updatedb
	sudo ldconfig
}

BANNER
DEPS
GITCLONEFUNC
GITSBMDLINIT
sudo python3 setup.py install
CPDESKTFL
