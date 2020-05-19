#!bin/bash


. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPOROOT=/opt/ITSEC/7.Mitm/7.Mitm/stenographer/google/stenographer
BRANCH=master

BANNER () {
	echo "${bold}
	 ____ _____ _____ _   _  ___   ____ ____      _    ____  _   _ _____ ____  
	/ ___|_   _| ____| \ | |/ _ \ / ___|  _ \    / \  |  _ \| | | | ____|  _ \ 
	\___ \ | | |  _| |  \| | | | | |  _| |_) |  / _ \ | |_) | |_| |  _| | |_) |
	 ___) || | | |___| |\  | |_| | |_| |  _ <  / ___ \|  __/|  _  | |___|  _ < 
	|____/ |_| |_____|_| \_|\___/ \____|_| \_\/_/   \_\_|   |_| |_|_____|_| \_\
		     
	INSTALL
	${normal}"
}

GITCLONEFUNC
sudo rm -f /usr/local/bin/$EXECUTEABLE2
make clean
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git pull
sudo ./install.sh