#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/epsylon/ufonet
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
GITCLONEDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon
EXECUTEABLE1=ufonet.sh
EXECUTEABLE2=ufonet
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/ufonet
DSKTPFL=ufonet.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet

BANNER () {
	echo "${bold}
	 _   _ _____ ___  _   _ _____ _____ 
	| | | |  ___/ _ \| \ | | ____|_   _|
	| | | | |_ | | | |  \| |  _|   | |  
	| |_| |  _|| |_| | |\  | |___  | |  
	 \___/|_|   \___/|_| \_|_____| |_|  
		   
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get install -y python-pycurl geoip-bin python-pygeoip python-whois
}

BINEXEC () {
	echo '#!/bin/bash
	cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
	./ufonet "$@"' > $EXECUTEABLE1
	CHMODXEX1
	CHMODXEX2
}

GITCLONEFUNC
DEPS
GITSBMDLINIT
# sudo python setup.py install
BINEXEC
SYMLINKEX2TO1
CPDESKTFL
