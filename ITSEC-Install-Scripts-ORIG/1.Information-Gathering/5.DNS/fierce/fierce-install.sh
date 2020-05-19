#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/mschwager/fierce.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager/fierce
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/fierce
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/fierce
DSKTPFL=fierce.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 _____ ___ _____ ____   ____ _____ 
	|  ___|_ _| ____|  _ \ / ___| ____|
	| |_   | ||  _| | |_) | |   |  _|  
	|  _|  | || |___|  _ <| |___| |___ 
	|_|   |___|_____|_| \_\\____|_____|
		   
	INSTALL
	${normal}"

}
DEPS () {
	sudo -H pip3 install -r requirements.txt
	sudo updatedb
	sudo ldconfig
}

BANNER
GITCLONEFUNC
DEPS
make clean
GITSBMDLINIT
sudo python3 setup.py install
CPDESKTFL
