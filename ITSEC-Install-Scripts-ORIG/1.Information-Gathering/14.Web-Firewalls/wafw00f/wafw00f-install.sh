#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/EnableSecurity/wafw00f.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/14.Web-Firewalls/wafw00f/EnableSecurity/wafw00f
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/14.Web-Firewalls/wafw00f/EnableSecurity
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/14.Web-Firewalls/wafw00f
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/14.Web-Firewalls/wafw00f
DSKTPFL=wafw00f.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/14.Web-Firewalls/wafw00f

BANNER () {
	echo "${bold}
	__        ___    _______        _____   ___  _____ 
	\ \      / / \  |  ___\ \      / / _ \ / _ \|  ___|
	 \ \ /\ / / _ \ | |_   \ \ /\ / / | | | | | | |_   
	  \ V  V / ___ \|  _|   \ V  V /| |_| | |_| |  _|  
	   \_/\_/_/   \_\_|      \_/\_/  \___/ \___/|_|    
	INSTALL
	${normal}"

}

BANNER
GITCLONEFUNC
GITSBMDLINIT

# needs makefile fix for pip "sudo -H pip install ..."
sed -i -e 's/pip install/sudo -H pip install/g' Makefile
make -j 4
sudo python3 setup.py install

CPDESKTFL
